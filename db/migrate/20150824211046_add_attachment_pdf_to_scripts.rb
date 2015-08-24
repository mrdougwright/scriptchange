class AddAttachmentPdfToScripts < ActiveRecord::Migration
  def self.up
    change_table :scripts do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :scripts, :pdf
  end
end
