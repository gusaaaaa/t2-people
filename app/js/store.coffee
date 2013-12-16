App.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

App.ApplicationSerializer = DS.ActiveModelSerializer.extend()

App.PersonAdapter = App.ApplicationAdapter.extend
  ajaxOptions: (url, type, hash) ->
    # return contentType: false + needed options
    # hang on to the data since super will try to stringify it
    if hash?.data?.formData?
      savedData = hash.data.formData
      hash.data = {}
      result = @_super(url, type, hash)
      result.contentType = false
      result.processData = false
      result.data = savedData
      result
    else
      @_super(url, type, hash)

App.PersonSerializer = App.ApplicationSerializer.extend
  serializeIntoHash: (data, type, record) ->
    # return the FormData from record
    data.formData = record.formData(@serialize(record))

App.RawTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized
  serialize: (deserialized) ->
    deserialized

App.DateTransform = DS.Transform.extend
  deserialize: (string) ->
    if !string
      null
    else
      [y, m, d] = string.split('-')
      new Date(y, m - 1, d)

  serialize: (date) ->
    if !date
      return null
    moment(date).format('YYYY-MM-DD')
