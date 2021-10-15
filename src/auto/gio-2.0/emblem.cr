require "../g_object-2.0/object"
require "./icon"

module Gio
  # #GEmblem is an implementation of #GIcon that supports
  # having an emblem, which is an icon with additional properties.
  # It can than be added to a #GEmblemedIcon.
  #
  # Currently, only metainformation about the emblem's origin is
  # supported. More may be added in the future.
  class Emblem < GObject::Object
    include Icon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, icon : GObject::Object? = nil, origin : Gio::EmblemOrigin? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if icon
        (_names.to_unsafe + _n).value = "icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon)
        _n += 1
      end
      if origin
        (_names.to_unsafe + _n).value = "origin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, origin)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Emblem.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_emblem_get_type
    end

    def icon=(value : Object?) : Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "icon", unsafe_value, Pointer(Void).null)
      value
    end

    def origin=(value : EmblemOrigin) : EmblemOrigin
      unsafe_value = value

      LibGObject.g_object_set(self, "origin", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(icon : Gio::Icon)
      # g_emblem_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_emblem_new(icon)
      @pointer = _retval
    end

    def self.new_with_origin(icon : Gio::Icon, origin : Gio::EmblemOrigin) : Gio::Emblem
      # g_emblem_new_with_origin: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_emblem_new_with_origin(icon, origin)
      Gio::Emblem.new(_retval, GICrystal::Transfer::Full)
    end

    def icon : Gio::Icon
      # g_emblem_get_icon: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_emblem_get_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def origin : Gio::EmblemOrigin
      # g_emblem_get_origin: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_emblem_get_origin(self)
      Gio::EmblemOrigin.from_value(_retval)
    end
  end
end
