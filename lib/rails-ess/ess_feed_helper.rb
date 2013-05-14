require 'action_view'
require 'ess'

module ActionView
  module Helpers
    module ESSFeedHelper
      def ess_feed(options = {}, &block)
        xml = eval("xml", block.binding)
        ess = ESS::Maker.make(options, &block)
        output = ess.to_xml!
        if options[:aggregators] || options[:push]
          ESS::Pusher.push_to_aggregators(options.merge(:data => output))
        end
        xml << output
      end
    end

    autoload :ESSFeedHelper
    include ESSFeedHelper
  end
end

