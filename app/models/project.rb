class Project < ApplicationRecord
  scope :proposed, -> { where(status: 'Proposed') }
  scope :accepted, -> { where(status: 'Accepted') }
  scope :under_review, -> { where(status: 'Under_review') }

  def self.handle_image_upload(uploaded_file)
    dir = Rails.root.join('public', 'uploads')
    Dir.mkdir(dir) unless Dir.exist?(dir)
    File.open(dir.join(uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.tempfile.read)
    end
    "/uploads/#{uploaded_file.original_filename}"
  end
end
