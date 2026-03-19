
# Traffic Light FSM

## Mô tả
Project thiết kế bộ điều khiển đèn giao thông bằng Verilog theo mô hình FSM (Finite State Machine).

## Chức năng
Hệ thống điều khiển 3 trạng thái đèn:
- RED
- GREEN
- YELLOW

Trình tự hoạt động:
RED -> GREEN -> YELLOW -> RED

## Cấu trúc thư mục
- `rtl/traffic_light_fsm.v`: mã RTL chính
- `tb/traffic_light_fsm_tb.v`: testbench mô phỏng

## Tín hiệu vào/ra
### Input
- `clk`: xung clock
- `rst_n`: reset tích cực mức thấp

### Output
- `red`: điều khiển đèn đỏ
- `yellow`: điều khiển đèn vàng
- `green`: điều khiển đèn xanh

## Nội dung kỹ thuật
- Thiết kế FSM với 3 trạng thái
- Sử dụng state register, next-state logic, output logic
- Có bộ đếm thời gian cho từng trạng thái đèn
- Có testbench để mô phỏng hoạt động hệ thống

## Công cụ sử dụng
- Verilog HDL
- ModelSim / Vivado Simulator / EDA Playground

## Kết quả mong đợi
Sau reset, hệ thống bắt đầu ở trạng thái RED, sau đó chuyển tuần tự:
- RED giữ trong vài chu kỳ clock
- chuyển sang GREEN
- sau đó chuyển sang YELLOW
- rồi quay lại RED

## Hướng phát triển
- Thêm bộ đếm hiển thị thời gian
- Mở rộng cho ngã tư 2 hướng
- Viết testbench nâng cao hơn bằng SystemVerilog
