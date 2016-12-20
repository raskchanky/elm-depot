module Main exposing (main)

import Html exposing (Html, div, text, program)
import Html.Attributes exposing (class)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { packages : List Package }


type alias Package =
    { ident : PackageIdent
    , checksum : String
    , manifest : String
    }


type alias PackageIdent =
    { origin : String
    , name : String
    , version : String
    , release : String
    }


samplePackage : Package
samplePackage =
    { ident =
        { origin = "core"
        , name = "redis"
        , version = "3.0.7"
        , release = "20160612150108"
        }
    , checksum = "abc123"
    , manifest = "aww yiss"
    }


initialModel : Model
initialModel =
    { packages = [ samplePackage ] }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "main" ]
        -- it might be worth making each of these pieces their own module
        [ header
        , sideNav
        , content
        , footer
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- This is the old content area I had
-- div [ class "main" ]
--     [ div [ class "header" ]
--         [ text "Search packages" ]
--     , div [ class "packages" ]
--         (displayPackages model.packages)
--     ]


header : Html Msg
header =
    div [ class "header" ]
        [ text "This is the header" ]


footer : Html Msg
footer =
    div [ class "footer" ]
        [ text "This is the footer" ]


sideNav : Html Msg
sideNav =
    div [ class "side-nav" ]
        [ text "This is the side nav" ]


content : Html Msg
content =
    div [ class "content" ]
        [ text "This is the main content area" ]


displayPackages : List Package -> List (Html Msg)
displayPackages packages =
    List.map displayPackage packages


displayPackage : Package -> Html Msg
displayPackage package =
    let
        ( originName, versionRelease ) =
            packageIdentifier package
    in
        div []
            [ div [] [ text originName ]
            , div [] [ text versionRelease ]
            ]


packageIdentifier : Package -> ( String, String )
packageIdentifier package =
    ( package.ident.origin ++ " / " ++ package.ident.name
    , package.ident.version ++ " / " ++ package.ident.release
    )
