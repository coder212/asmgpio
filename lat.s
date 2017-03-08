.text
.align 2
.global main
main:
     PUSH {R7, LR}
     SUB SP, SP, #8
     ADD R7, SP, #0
     BL sunxi_gpio_init
     MOVS R0, #17
     MOVS R1, #1
     BL sunxi_gpio_set_cfgpin
     MOVS R3, #0
     STR R3, [R7, #4]
     B whileloop
blink:
     MOVS R0, #17
     MOVS R1, #1
     BL sunxi_gpio_output
     MOVS R0, #1
     BL sleep
     MOVS R0, #17
     MOVS R1, #0
     BL sunxi_gpio_output
     MOVS R0, #1
     BL sleep
     LDR R3, [R7, #4]
     ADDS R3, R3, #1
     STR R3, [R7, #4]
whileloop:
         LDR R3, [R7, #4]
         CMP R3, #10
         BLE blink
         MOV R0, R3
         ADDS R7, R7, #8
         MOV SP, R7
         POP {R7, PC}
