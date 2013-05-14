require 'action_view'

module ActionView
  module Helpers
    module ESSFeedHelper
      def ess_feed(options = {}, &block)
        xml = eval("xml", block.binding)
        ess = ESS::Maker.make(options, &block)
        ess.to_xml! xml
      end
    end
  end
end

