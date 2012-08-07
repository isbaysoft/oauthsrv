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

end
