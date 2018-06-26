jQuery(document).on 'turbolinks:load', ->
  $comments = $('#comments')
  $new_comment_form = $('#new-comment')
  $new_comment_body = $new_comment_form.find('#comment-body')

  if $comments.length > 0
    App.comments = App.cable.subscriptions.create {
      channel: "CommentsChannel"
      article_id: window.location.pathname.split("/")[2]
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if data['comment']
          $new_comment_body.val('')
          $comments.append data['comment']

      send_comment: (comment, article_id) ->
        @perform 'send_comment', comment: comment, article_id: article_id

    $new_comment_form.submit (e) ->
        $this = $(this)
        comment_body = $new_comment_body.val()
        if $.trim(comment_body).length > 0
          App.comments.send_comment comment_body, window.location.pathname.split("/")[2]

        e.preventDefault()
        return false
