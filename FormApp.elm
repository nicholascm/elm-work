import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (trim, length, isEmpty, any)
import Char exposing (isDigit, isLower, isUpper)

main = 
    Html.beginnerProgram { model = model, view = view, update = update }

-- Model 

type alias Model = 
    { name : String
    , password : String
    , passwordAgain : String
    }

model : Model 
model = 
    Model "" "" ""

-- update

type Msg
    = Name String 
    | Password String 
    | PasswordAgain String 

update : Msg -> Model -> Model 
update msg model =
    case msg of 
        Name name -> 
            { model | name = name }
            
        Password password -> 
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }

-- view 

view : Model -> Html Msg
view model = 
    div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] [] 
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
        , viewValidation model
        , passwordValidation model
        ]

viewValidation: Model -> Html msg
viewValidation model = 
    let 
        (color, message) = 
            if model.password == model.passwordAgain then 
                ("green", "Ok")
            else 
                ("red", "Passwords do not match")
    in 
        div [ style [("color", color)]] [ text message ]

passwordValidation: Model -> Html msg
passwordValidation model = 
    let
        (passwordValidityMessage) = 
            if length model.password < 8 then 
                ("Please provide a password of at least 8 characters")
            else if any isDigit model.password == True then 
                ("Please ensure a number is in your password.")
            else
                ("Password looks valid.")
    in 
        div [] [ text passwordValidityMessage ]