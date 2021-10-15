require "./render_node"

module Gsk
  # A render node applying a rounded rectangle clip to its single child.
  class RoundedClipNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_rounded_clip_node_get_type
    end

    def initialize(child : Gsk::RenderNode, clip : Gsk::RoundedRect)
      # gsk_rounded_clip_node_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_clip_node_new(child, clip)
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_rounded_clip_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_clip_node_get_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def clip : Gsk::RoundedRect
      # gsk_rounded_clip_node_get_clip: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_clip_node_get_clip(self)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
