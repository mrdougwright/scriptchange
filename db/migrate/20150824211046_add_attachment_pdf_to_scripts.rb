class AddAttachmentPdfToScripts < ActiveRecord::Migration
  def self.up
    add_attachment :scripts, :pdf
  end

  def self.down
    remove_attachment :scripts, :pdf
  end
end
