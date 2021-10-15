module Gtk
  # An opaque structure representing a watched `GtkExpression`.
  #
  # The contents of `GtkExpressionWatch` should only be accessed through the
  # provided API.
  class ExpressionWatch
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ExpressionWatch.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ExpressionWatch.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_expression_watch_get_type
    end

    def evaluate(value : _) : Bool
      # gtk_expression_watch_evaluate: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_expression_watch_evaluate(self, value)
      GICrystal.to_bool(_retval)
    end

    def ref : Gtk::ExpressionWatch
      # gtk_expression_watch_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_expression_watch_ref(self)
      Gtk::ExpressionWatch.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gtk_expression_watch_unref: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_expression_watch_unref(self)
    end

    def unwatch : Nil
      # gtk_expression_watch_unwatch: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_expression_watch_unwatch(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
