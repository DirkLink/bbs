require 'test_helper'
include FactoryGirl::Syntax::Methods

class CommentsControllerTest < ActionController::TestCase
  def test_users_can_create_comments
    p = create(:post)
    u = create(:user)
    post(:create, board_id: p.board_id, post_id: p.id, body: "poop", user_id: u.id)
    assert 1, Comment.count
    # assert "poop", comment.body
  end

  def test_users_can_delete_their_comments

  end
end
