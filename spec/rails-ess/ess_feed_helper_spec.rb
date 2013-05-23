require 'spec_helper'

class TestClass
  include ActionView::Helpers::ESSFeedHelper
end

describe "ess_feed helper" do
  let(:xml) { xml = Builder::XmlMarkup.new }

  it 'should allow creating an xml feed' do
    ESS::Pusher.should_not_receive(:push_to_aggregators)
    TestClass.new.ess_feed :validate => false do |ess|
      ess.channel do |channel|
        channel.title "A sample title"
      end
    end
    doc = xml.target!
    doc.should include("<?xml")
    doc.should include("<ess")
    doc.should include("<title>A sample title</title>")
  end

  context 'when given the :push option' do
    it 'should send the feed to aggregators' do
      ESS::Pusher.should_receive(:push_to_aggregators)
      TestClass.new.ess_feed :validate => false, :push => true do |ess|
        ess.channel do |channel|
          channel.title "A sample title"
        end
      end
    end
  end
end

