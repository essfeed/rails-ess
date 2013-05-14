require 'action_view'
require 'ess'

module ActionView
  module Helpers
    module ESSFeedHelper
      def ess_feed(options = {}, &block)
        xml = eval("xml", block.binding)
        ess = ESS::Maker.make(options, &block)
        xml << ess.to_xml!
      end
    end

    autoload :ESSFeedHelper
    include ESSFeedHelper
  end
end

