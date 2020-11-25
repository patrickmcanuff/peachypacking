$(document).on('turbolinks:load', function(){
  var projects = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/projects/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#projects_search').typeahead(null, {
    source: projects
  });
})
