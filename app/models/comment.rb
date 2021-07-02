class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :interview_question

  validates :content, presence: true 


  def display_date
    self.created_at.strftime("%d %b. %Y")
  end

  def self.order_and_limit
    Comment.all.order('created_at DESC').take(3)
  end
  #class method or make scope ?

end



# <% @interview_question.comments.sort_by{|t| - t.created_at.to_i}.first(3).each do |c| %>
#   <li> <%= c.user.name %> said "<%= link_to truncate(c.content, :length => 65), comment_path(c) %>" on <%= c.created_at.strftime("%d %b. %Y") %>  </li>