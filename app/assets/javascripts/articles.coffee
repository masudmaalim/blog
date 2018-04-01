# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("form#new_comment").hide()
  $("table#comments_table").hide()
  $("button#comments_table_button").hide()
  $("button#comment_button").on 'click', (event) ->
    $("form#new_comment").show()
    $("button#comments_table_button").show()
  $("button#comments_table_button").on 'click', (event) ->
    $("table#comments_table").show()


  $("span.fidelity").on 'click', (event) ->
    x = $(this).data("truth-id")
    val=$(this).text()
    #console.log($(this).data("truth-id"))
    #console.log(val)
    $(this).text(parseInt(val)+1)

  $("button.save").on 'click', (event) ->
    commentor=$("input#html_form_commentor").val()
    body=$("input#html_form_body").val()
    checkbox=$("input#html_form_checkbox").is(":checked")
    #console.log(commentor)
    #console.log(body)
    #console.log(checkbox)
    article_id = $("form#form_two").data("article-id")
    comment_params =
      comment:
        commentor: commentor
        body: body
        checkbox: checkbox
    #console.log(article_id)
    $.ajax
      url: "/articles/#{article_id}/comments"
      type: 'POST'
      data: comment_params
      statusCode:
        201: (response) ->
          html = "<tr><td>#{response.commentor}</td><td>#{response.body}</td><td>#{response.article_id}</td></tr>"
          $("table#comments_table").find("tbody").append(html)
          console.log(html)

  		dataType: 'JSON'
