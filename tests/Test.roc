interface Test
    exposes [ test ]
    imports []


test = \isSuccessful, failureMessage ->
    \previousFailureMessages ->
        if isSuccessful then
            previousFailureMessages
        else
            Str.concat previousFailureMessages failureMessage
