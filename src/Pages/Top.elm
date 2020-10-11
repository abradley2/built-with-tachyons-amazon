module Pages.Top exposing (Model, Msg, Params, page)

import Html as H
import Html.Attributes as A
import Html.Events as E
import Shared
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)


type alias Params =
    ()


type alias Model =
    Url Params


type alias Msg =
    Never


page : Page Params Model Msg
page =
    Page.application
        { view = view
        , init = init
        , save = save
        , load = load
        , subscriptions = subscriptions
        , update = update
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none


load : Shared.Model -> Model -> ( Model, Cmd Msg )
load shared model =
    ( model, Cmd.none )


save : Model -> Shared.Model -> Shared.Model
save model shared =
    shared


init : Shared.Model -> Url Params -> ( Model, Cmd Msg )
init shared params =
    ( params, Cmd.none )



-- VIEW


searchBarView : Model -> H.Html Msg
searchBarView model =
    H.div
        [ A.class "self-center"
        ]
        [ H.button
            [ A.class "button-reset bg-light-gray h2 border-box br3 br--left w3"
            ]
            [ H.span
                [ A.class "f6 grey dib mr2"
                ]
                [ H.text "All"
                ]
            , H.i
                [ A.class "fas fa-angle-down"
                ]
                []
            ]
        , H.input
            [ A.class "input-reset h2 border-box w5-ns ph3"
            , A.placeholder "Search for a product"
            ]
            []
        , H.button
            [ A.class "button-reset h2 border-box br3 br--right bg-yellow black-60 w3"
            ]
            [ H.i
                [ A.class "fas fa-search"
                ]
                []
            ]
        ]


headerView : Model -> H.Html Msg
headerView model =
    H.div
        [ A.class "h3 bg-black-90 ph2 flex items-stretch justify-between"
        ]
        [ H.button
            [ A.class "button-reset"
            ]
            [ H.i
                [ A.class "fas fa-bars white-90 br2 pa2 f3 b--white-90 ba ma2"
                ]
                []
            ]
        , searchBarView model
        , H.div
            []
            []
        ]


locationSelectView : Model -> H.Html Msg
locationSelectView model =
    H.button
        [ A.class "button-reset dt white h3 inline-flex items-stretch"
        ]
        [ H.i
            [ A.class "fas fa-map-marker-alt white pr3 self-center"
            ]
            []
        , H.div
            [ A.class "dtc v-mid f6 self-center tl"
            ]
            [ H.span
                []
                [ H.text "Hello there,"
                ]
            , H.br [] []
            , H.span
                [ A.class "fw8"
                ]
                [ H.text "Select your location"
                ]
            ]
        ]


bookmarksView : Model -> H.Html Msg
bookmarksView model =
    H.div
        [ A.class "ph3"
        ]
        (List.map
            (\title ->
                H.div
                    [ A.class "dib h3 mr3"
                    ]
                    [ H.a
                        [ A.href "/"
                        , A.class "f6 link white dtc h3 v-mid underline-hover"
                        ]
                        [ H.text title
                        ]
                    ]
            )
            [ "New Releases"
            , "Amazon Basics"
            , "Whole Foods"
            , "Customer Service"
            , "Best Sellers"
            , "Today's Deals"
            ]
        )


announcementView : Model -> H.Html Msg
announcementView model =
    H.div
        [ A.class "h3 pl3 fw8"
        ]
        [ H.div
            [ A.class "white dtc h3 v-mid"
            ]
            [ H.text "Prime Day is October 13-14th"
            ]
        ]


subHeaderView : Model -> H.Html Msg
subHeaderView model =
    H.div
        [ A.class "h3 bg-navy ph4 flex justify-between"
        ]
        [ locationSelectView model
        , bookmarksView model
        , announcementView model
        ]


bodyView : Model -> H.Html Msg
bodyView model =
    H.div
        [ A.class "vh-100 black-60"
        ]
        [ headerView model
        , subHeaderView model
        ]


view : Model -> Document Msg
view model =
    { title = "Homepage"
    , body = [ bodyView model ]
    }


lorem : String
lorem =
    """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
"""


loremLong : String
loremLong =
    """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
