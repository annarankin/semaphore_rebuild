"use strict";

function submitRebuildParams(event) {
  var params = $('.controls input').map(function mapParams(idx, el){
    var obj = {};
    obj.name = $(el).attr('name');
    obj.value = $(el).val();
    return obj;
  });

  var rebuildUrl = '/api/rebuild?' + $.param(params);

  $.ajax({
    method: 'POST',
    url: rebuildUrl
  });
}

function setUpBranchPage() {
  console.log('You are playing a dangerous game.');

  var $button = $('#rebuild-btn');

  $button.on('click', submitRebuildParams);
}

setUpBranchPage();