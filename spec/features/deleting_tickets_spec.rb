require "rails_helper"

RSpec.feature "Users can delete ticket" do 
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project) }

  before do 
    visit project_ticket_path(project, ticket)
    click_link "Delete Ticket"
  end

  scenario "successfully" do 
    expect(page).to have_content "Ticket has been deleted."
    expect(page).to_not have_content ticket.name
    expect(page.current_url).to eq project_url(project)
  end
end