package main

import "fmt"

type Income struct {
	Id          string
	Name        string
	Description string
	Value       float64
}

type Expense struct {
	Id          string
	Name        string
	Description string
	Value       float64
}

type Movement struct {
	Movement []MovementInterface
}

type MovementInterface interface {
	SetValue(value float64)
	GetValue() float64
}

func (i Income) SetValue(value float64) {
	i.Value = value
}

func (e Expense) SetValue(value float64) {
	e.Value = value
}

func (i Income) GetValue() float64 {
	return i.Value
}

func (e Expense) GetValue() float64 {
	return e.Value
}

func main() {
	var mov Movement
	mov.Movement = make([]MovementInterface, 10)

	for i := 0; i < 10; i++ {
		if i%2 == 0 {
			var inc = Income{}
			inc.Value = float64(i)
			mov.Movement[i] = inc
		} else {
			exp := Expense{}
			exp.Value = float64(i)
			mov.Movement[i] = exp
		}
	}

	for _, v := range mov.Movement {
		fmt.Println(v.GetValue())
	}

}
