require 'test_helper'
include FactoryGirl::Syntax::Methods

class CommentsControllerTest < ActionController::TestCase
  def test_users_can_create_comments
    p = create(:post)
    create(:user)
    u = login
    post(:create, board_id: p.board_id, post_id: p.id, body: "poop", author_id: u.id)
    assert 1, Comment.count
    comment = Comment.last
    assert_equal "poop", comment.body
    assert_equal "302", response.code
    assert_includes response.redirect_url, board_post_comment_path(comment.post.board, comment.post, comment)
  end

  def test_users_can_delete_their_comments

  end
end
