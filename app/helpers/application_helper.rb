module ApplicationHelper

	def render_tabs(*args)
		options = args.extract_options!
		if options.has_key?(:tabs)
			render :partial => 'shared/tabsv', :locals => {:tabs => options[:tabs], :form_object => options[:form_object]  }
		else
			content_tag 'p', t(:text_no_data), :class => "nodata"
		end
	end

	def document_tabs
	[
		{:name => 'profile', :partial => 'profile', :label => 'Profile'},
		{:name => 'applications', :partial => 'applications', :label => 'Applications'},
	]
	end

	def inline_error(object,key)
		content_tag :span, class: 'help-inline' do
			content_tag(:i, nil,  class: 'icon-thumbs-down') << ' ' << object.errors.get(key.to_sym).first
		end if object.errors.has_key?(key.to_sym)
	end

end
