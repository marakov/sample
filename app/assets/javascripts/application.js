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
    $(function () {
        var minlength = 3;
        $("#channelNameSearch").keyup(function () {
            value = $(this).val();
            if (value.length >= minlength) {
                channelsAjaxSearch()
            } else if (value.length == 0){
                channelsAjaxSearch()
            }

        })
        $("#channelUriSearch").keyup(function () {
            value = $(this).val();
            if (value.length >= minlength) {
                channelsAjaxSearch()
            } else if (value.length == 0){
                channelsAjaxSearch()
            }
        })

    })
    function buildChannelSearchParams() {
        var name = $("#channelNameSearch").val();
        var uri = $("#channelUriSearch").val();
        var channel = {channel: {name: name, uri: uri}}
        return channel;
    }
    function channelsAjaxSearch() {
        var channel = buildChannelSearchParams();
        $.ajax({
            url: "/channels",
            type: "POST",
            data: JSON.stringify(channel),
            contentType: "application/json",
            dataType: "script",
            success: function (r) {
            }
        })
    }
});