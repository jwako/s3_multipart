module S3Multipart
  module ActionViewHelpers
    module FormHelper
      def multipart_uploader_form(options = {})
        uploader_digest = S3Multipart::Uploader.serialize(options[:uploader])
        html = file_field_tag options[:input_name], :accept => options[:types].join(','), :data => {:uploader => uploader_digest}
        html << options[:html].html_safe
        html << submit_tag(options[:button_text], {:type => "button", :class => options[:button_class], :onclick => "jmedia.uploadCheck();" })
        # html << button_tag(:class => options[:button_class]) do
        #   content_tag(:span, options[:button_text])
        # end
      end
    end
  end
end

ActionView::Base.send :include, S3Multipart::ActionViewHelpers::FormHelper