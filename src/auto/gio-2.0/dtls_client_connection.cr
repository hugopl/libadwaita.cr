module Gio
  # #GDtlsClientConnection is the client-side subclass of
  # #GDtlsConnection, representing a client-side DTLS connection.
  module DtlsClientConnection
    def new(base_socket : Gio::DatagramBased, server_identity : Gio::SocketConnectable?) : Gio::DtlsClientConnection
      # g_dtls_client_connection_new: (Throws)
      # @server_identity: (nullable)
      # Returns: (transfer full)

      server_identity = if server_identity.nil?
                          Pointer(Void).null
                        else
                          server_identity.to_unsafe
                        end

      _retval = LibGio.g_dtls_client_connection_new(base_socket, server_identity)
      Gio::DtlsClientConnection__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def accepted_cas : GLib::List
      # g_dtls_client_connection_get_accepted_cas: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_dtls_client_connection_get_accepted_cas(self)
      GLib::List(Enumerable(UInt8)).new(_retval, GICrystal::Transfer::Full)
    end

    def server_identity : Gio::SocketConnectable
      # g_dtls_client_connection_get_server_identity: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_client_connection_get_server_identity(self)
      Gio::SocketConnectable__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def validation_flags : Gio::TlsCertificateFlags
      # g_dtls_client_connection_get_validation_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_client_connection_get_validation_flags(self)
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def server_identity=(identity : Gio::SocketConnectable) : Nil
      # g_dtls_client_connection_set_server_identity: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_dtls_client_connection_set_server_identity(self, identity)
    end

    def validation_flags=(flags : Gio::TlsCertificateFlags) : Nil
      # g_dtls_client_connection_set_validation_flags: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_dtls_client_connection_set_validation_flags(self, flags)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DtlsClientConnection__Impl
    include DtlsClientConnection

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
      LibGio.g_dtls_client_connection_get_type
    end

    # Cast a `GObject::Object` to `DtlsClientConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DtlsClientConnection")
    end

    # Cast a `GObject::Object` to `DtlsClientConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
