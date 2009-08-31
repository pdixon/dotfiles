#! /usr/bin/python2.5

def calc_loan(salary, threshold=18148):
    return (salary-threshold)*0.10


TAX_BRACKETS = ((0, 14000, 0.139),
                (14001, 40000, 0.224),
                (40001, 70000, 0.344),
                (70001, 500000, 0.404))

def calc_bracket(b, salary):
    i = (b[1] - b[0]) if salary > b[1] else ((salary - b[0]) if salary > b[0] else 0)
    return i * b[2]

def calc_paye(salary):
    paye = 0
    for b in TAX_BRACKETS:
        t = calc_bracket(b, salary)
        paye = paye + t
    return paye

def main(salary):
    loan = calc_loan(salary)
    paye = calc_paye(salary)
    print "Loan repayment: $%d"%loan
    print "PAYE: $%d"%paye


import

if __name__ == '__main__':
    import sys
    main(int(sys.argv[1]))
