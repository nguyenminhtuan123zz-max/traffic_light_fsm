module traffic_light_fsm (
    input  wire clk,
    input  wire rst_n,
    output reg  red,
    output reg  yellow,
    output reg  green
);

    // State encoding
    parameter RED_STATE    = 2'b00;
    parameter GREEN_STATE  = 2'b01;
    parameter YELLOW_STATE = 2'b10;

    // Duration for each light
    parameter RED_TIME    = 5;
    parameter GREEN_TIME  = 5;
    parameter YELLOW_TIME = 2;

    reg [1:0] current_state, next_state;
    reg [3:0] timer;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= RED_STATE;
            timer <= 0;
        end else begin
            current_state <= next_state;

            if (current_state != next_state)
                timer <= 0;
            else
                timer <= timer + 1;
        end
    end

    // Next-state logic
    always @(*) begin
        next_state = current_state;

        case (current_state)
            RED_STATE: begin
                if (timer == RED_TIME - 1)
                    next_state = GREEN_STATE;
            end

            GREEN_STATE: begin
                if (timer == GREEN_TIME - 1)
                    next_state = YELLOW_STATE;
            end

            YELLOW_STATE: begin
                if (timer == YELLOW_TIME - 1)
                    next_state = RED_STATE;
            end

            default: begin
                next_state = RED_STATE;
            end
        endcase
    end

    // Output logic
    always @(*) begin
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;

        case (current_state)
            RED_STATE:    red    = 1'b1;
            GREEN_STATE:  green  = 1'b1;
            YELLOW_STATE: yellow = 1'b1;
            default:      red    = 1'b1;
        endcase
    end

endmodule
