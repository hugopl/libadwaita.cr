require "../g_object-2.0/object"
require "../gio-2.0/list_model"

require "./selection_model"

module Gtk
  # `GtkNoSelection` is a `GtkSelectionModel` that does not allow selecting
  # anything.
  #
  # This model is meant to be used as a simple wrapper around a `GListModel`
  # when a `GtkSelectionModel` is required.
  class NoSelection < GObject::Object
    include Gio::ListModel
    include SelectionModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gio::ListModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NoSelection.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_no_selection_get_type
    end

    def initialize(model : Gio::ListModel?)
      # gtk_no_selection_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      LibGObject.g_object_ref(model)

      _retval = LibGtk.gtk_no_selection_new(model)
      @pointer = _retval
    end

    def model : Gio::ListModel
      # gtk_no_selection_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_no_selection_get_model(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_no_selection_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_no_selection_set_model(self, model)
    end
  end
end
