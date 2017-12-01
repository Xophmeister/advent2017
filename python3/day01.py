def inverse_captcha(s:str, offset:int) -> int:
    rotated = s[offset:] + s[:offset]
    return sum(map(lambda x: int(x[0]),
                   filter(lambda x: x[0] == x[1],
                          zip(s, rotated))))

def rotate_one(s:str) -> int:
    return inverse_captcha(s, 1)

def rotate_half(s:str) -> int:
    return inverse_captcha(s, len(s) // 2)

assert rotate_one("1122") == 3
assert rotate_one("1111") == 4
assert rotate_one("1234") == 0
assert rotate_one("91212129") == 9

assert rotate_half("1212") == 6
assert rotate_half("1221") == 0
assert rotate_half("123425") == 4
assert rotate_half("123123") == 12
assert rotate_half("12131415") == 4
