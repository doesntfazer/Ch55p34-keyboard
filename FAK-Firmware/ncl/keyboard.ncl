let { MatrixKey, .. } = import "../ncl/fak/keyboard.ncl" in
let { CH552T, .. } = import "../ncl/fak/mcus.ncl" in

{
  mcu = CH552T,
  matrix = {
    cols = [31, 11, 10, 13, 17, 30, 33, 34, 35, 12],
    rows = [32, 14, 15, 16]
  },
  usb_dev = {
    vendor_id = 43962, # 0xABBA
    product_id = 1,
    product_ver = 256, # 0x0100
  },
  keys =
    let M = MatrixKey in
    [
      M 0 0, M 1 0, M 2 0, M 3 0, M 4 0,     M 5 0, M 6 0, M 7 0, M 8 0, M 9 0,
      M 0 1, M 1 1, M 2 1, M 3 1, M 4 1,     M 5 1, M 6 1, M 7 1, M 8 1, M 9 1,
      M 0 2, M 1 2, M 2 2, M 3 2, M 4 2,     M 5 2, M 6 2, M 7 2, M 8 2, M 9 2,
                           M 3 3, M 4 3,     M 5 3, M 6 3,
    ]
}