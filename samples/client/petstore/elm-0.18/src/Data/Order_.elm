{-
   OpenAPI Petstore
   This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.Order_ exposing (Order_, Status(..), orderDecoder, orderEncoder)

import DateTime exposing (DateTime, dateTimeDecoder, dateTimeEncoder)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (decode, optional, required)
import Json.Encode as Encode
import Maybe exposing (map, withDefault)


{-| An order for a pets from the pet store
-}
type alias Order_ =
    { id : Maybe Int
    , petId : Maybe Int
    , quantity : Maybe Int
    , shipDate : Maybe DateTime
    , status : Maybe Status
    , complete : Maybe Bool
    }


type Status
    = Placed
    | Approved
    | Delivered


orderDecoder : Decoder Order_
orderDecoder =
    decode Order_
        |> optional "id" (Decode.nullable Decode.int) Nothing
        |> optional "petId" (Decode.nullable Decode.int) Nothing
        |> optional "quantity" (Decode.nullable Decode.int) Nothing
        |> optional "shipDate" (Decode.nullable dateTimeDecoder) Nothing
        |> optional "status" (Decode.nullable statusDecoder) Nothing
        |> optional "complete" (Decode.nullable Decode.bool) (Just False)


orderEncoder : Order_ -> Encode.Value
orderEncoder model =
    Encode.object
        [ ( "id", withDefault Encode.null (map Encode.int model.id) )
        , ( "petId", withDefault Encode.null (map Encode.int model.petId) )
        , ( "quantity", withDefault Encode.null (map Encode.int model.quantity) )
        , ( "shipDate", withDefault Encode.null (map dateTimeEncoder model.shipDate) )
        , ( "status", withDefault Encode.null (map statusEncoder model.status) )
        , ( "complete", withDefault Encode.null (map Encode.bool model.complete) )
        ]


statusDecoder : Decoder Status
statusDecoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "placed" ->
                        Decode.succeed Placed

                    "approved" ->
                        Decode.succeed Approved

                    "delivered" ->
                        Decode.succeed Delivered

                    other ->
                        Decode.fail <| "Unknown type: " ++ other
            )


statusEncoder : Status -> Encode.Value
statusEncoder model =
    case model of
        Placed ->
            Encode.string "placed"

        Approved ->
            Encode.string "approved"

        Delivered ->
            Encode.string "delivered"
