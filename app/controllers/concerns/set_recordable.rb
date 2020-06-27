module SetRecordable
  extend ActiveSupport::Concern

  included do
    before_action :set_recordable, except: [:index, :new, :create] 
  end

  private
    def set_recordable
      @recording = @bucket.recordings.find(params[:id])
      @recordable = @recording.recordable
    end
end
