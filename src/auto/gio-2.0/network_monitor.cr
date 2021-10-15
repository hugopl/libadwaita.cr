module Gio
  # #GNetworkMonitor provides an easy-to-use cross-platform API
  # for monitoring network connectivity. On Linux, the available
  # implementations are based on the kernel's netlink interface and
  # on NetworkManager.
  #
  # There is also an implementation for use inside Flatpak sandboxes.
  module NetworkMonitor
    def self.default : Gio::NetworkMonitor
      # g_network_monitor_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_network_monitor_get_default
      Gio::NetworkMonitor__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def can_reach(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?) : Bool
      # g_network_monitor_can_reach: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_network_monitor_can_reach(self, connectable, cancellable)
      GICrystal.to_bool(_retval)
    end

    def can_reach_async(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_network_monitor_can_reach_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_network_monitor_can_reach_async(self, connectable, cancellable, callback, user_data)
    end

    def can_reach_finish(result : Gio::AsyncResult) : Bool
      # g_network_monitor_can_reach_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_network_monitor_can_reach_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def connectivity : Gio::NetworkConnectivity
      # g_network_monitor_get_connectivity: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_monitor_get_connectivity(self)
      Gio::NetworkConnectivity.from_value(_retval)
    end

    def network_available? : Bool
      # g_network_monitor_get_network_available: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_monitor_get_network_available(self)
      GICrystal.to_bool(_retval)
    end

    def network_metered? : Bool
      # g_network_monitor_get_network_metered: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_monitor_get_network_metered(self)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class NetworkMonitor__Impl
    include NetworkMonitor

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_network_monitor_get_type
    end

    # Cast a `GObject::Object` to `NetworkMonitor`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to NetworkMonitor")
    end

    # Cast a `GObject::Object` to `NetworkMonitor`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
