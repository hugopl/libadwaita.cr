require "./filter"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkMultiFilter` is the base class for filters that combine multiple filters.
  class MultiFilter < Filter
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_multi_filter_get_type
    end

    def append(filter : Gtk::Filter) : Nil
      # gtk_multi_filter_append: (Method)
      # @filter: (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(filter)

      LibGtk.gtk_multi_filter_append(self, filter)
    end

    def remove(position : UInt32) : Nil
      # gtk_multi_filter_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_multi_filter_remove(self, position)
    end
  end
end
