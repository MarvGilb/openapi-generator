/*
 * OpenAPI Petstore
 *
 * This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\
 *
 * API version: 1.0.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package petstore

type ArrayTest struct {
	ArrayOfString       []string          `json:"array_of_string,omitempty"`
	ArrayArrayOfInteger [][]int64         `json:"array_array_of_integer,omitempty"`
	ArrayArrayOfModel   [][]ReadOnlyFirst `json:"array_array_of_model,omitempty"`
}
