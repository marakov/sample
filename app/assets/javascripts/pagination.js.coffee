jQuery ->
  if $('#infinite-scrolling').size() > 0
    $('#recentNews').on 'scroll', ->
      curScroll = $(this)[0].scrollTop
      maxScroll = $(this)[0].scrollHeight - $(this).height();
      console.log(curScroll, ' :: ', maxScroll)
      more_posts_url = $('.pagination .next_page a').attr('href')
      if more_posts_url && curScroll >= maxScroll - 200
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url
      return
      return