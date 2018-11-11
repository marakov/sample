// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//\
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(document).ready(function () {
    var subbedClass = 'subbed';
    var hasSub = document.getElementsByClassName('has-sub');
    Array.prototype.filter.call(hasSub, function (e) {
        for (var i = 0; i < e.childNodes.length; i++) {
            if (className != null) {
                f = className.search(expr);
                if (f) {
                    has_sub = e.childNodes[i].text;
                    if (has_sub) {
                        subText(e, "Subscribed");
                        e.classList.add(subbedClass);
                    } else {
                        subText(e, "Subscribe");
                        e.classList.remove(subbedClass);
                    }
                }
            }
        }

    });
    $(".subscribe-button").click(function () {
        var text;
        var count = this.dataset.count;
        var ch_id = this.parentElement.parentElement.id;
        console.log(count)
        subscribe = {subscribe: {channel_id: ch_id, user_id: currentUser.id}}
        if (this.classList.contains(subbedClass)) {
            $.ajax({
                url: '/subscribe',
                type: 'DELETE',
                data: JSON.stringify(subscribe),
                contentType: "application/json",
                success: function (r) {
                }
            });
            this.classList.remove(subbedClass);
            text = 'Subscribe';
            count--;
        }
        else {
            $.ajax({
                url: '/subscribe',
                type: 'POST',
                data: JSON.stringify(subscribe),
                contentType: "application/json",
                success: function (r) {
                }
            });
            this.classList.add(subbedClass);
            text = 'Subscribed';
            count++;
        }

        this.querySelector('.subscribe-text').innerHTML = text;
        this.dataset.count = count;
    });

    function subText(e, text) {
        e.getElementsByClassName('.subscribe-text').innerHTML = text;
    }
});