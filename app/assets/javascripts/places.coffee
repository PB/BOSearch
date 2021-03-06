ready = ->
  $(".form-inline").on("ajax:success", (e, data, status, xhr) ->
    startAt = new Date($('#from').val())
    endsAt = new Date($('#to').val())
    $('.list-group .list-group-item').each ->
      ba = new Date($(this).find('.begins').text())
      ea = new Date($(this).find('.ends').text())
      if(startAt >= ba && endsAt <= ea)
        $(this).addClass('active')
  ).on "ajax:error", (e, xhr, status, error) ->
    alert('Please fill in all fields')

  $(document).on 'keyup', '#min', (e) ->
    $('#max').val($(this).val())
    if($('#from').val() != '')
      $('#from').trigger('change')

  $(document).on 'change', '#from', (e) ->
    if($('#min').val() > 0 && $('#min').val() == $('#max').val())
      date = new Date($('#from').val())
      days = parseInt($('#min').val(), 10)
      if(!isNaN(date.getTime()))
        date.setDate(date.getDate() + days)
        stringDate = (date.toInputFormat())
        $('#to').val(date.toInputFormat())
      else
        alert('Invalid Date')


$(document).ready(ready)
$(document).on('page:load', ready)

Date.prototype.toInputFormat = ->
  yyyy = this.getFullYear().toString()
  mm = (this.getMonth()+1).toString()
  if(!mm[1])
    mm = '0'+mm
  dd  = this.getDate().toString()
  if(!dd[1])
    dd = '0'+dd
  yyyy + '-' + mm + '-' + dd