package core

type NoAsAServiceTwoError struct {
	IsNoAsAServiceTwoError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewNoAsAServiceTwoError(code string, msg string, ctx *Context) *NoAsAServiceTwoError {
	return &NoAsAServiceTwoError{
		IsNoAsAServiceTwoError: true,
		Sdk:              "NoAsAServiceTwo",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *NoAsAServiceTwoError) Error() string {
	return e.Msg
}
