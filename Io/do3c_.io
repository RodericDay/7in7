OperatorTable addAssignOperator(":", "colonAssign")

Number to := method(end,

    range := Range clone
    range setRange(self, end)

)
