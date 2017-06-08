import Html exposing(Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput) 

main = 
    Html.beginnerProgram { model = model, view = view, update = update }

-- model

type alias Model = 
    { content: String }

model: Model 
model = 
    { content = "" }

-- update 

type Msg
    = Change String 

update : Msg -> Model -> Model 
update msg model = 
    case msg of
        Change newContent -> 
            { model | content = newContent }

toFullName : { firstName : String, lastName : String } -> String
toFullName person = 
    person.firstName ++ " " ++ person.lastName

fullName: String
fullName = 
    toFullName { firstName = "Hermann", lastName = "Hesse" }

-- view 

view: Model -> Html Msg
view model = 
 div[]
    [ input [ placeholder "Text to reverse", onInput Change ][]
    , div[] [ text (String.reverse model.content) ]
    ]