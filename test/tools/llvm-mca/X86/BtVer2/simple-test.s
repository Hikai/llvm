# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -iterations=100 < %s | FileCheck %s

add %edi, %eax

# CHECK: Iterations:     100
# CHECK-NEXT: Instructions:   100
# CHECK-NEXT: Total Cycles:   103
# CHECK-NEXT: Dispatch Width: 2
# CHECK-NEXT: IPC:            0.97


# CHECK: Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects

# CHECK: [1]    [2]    [3]    [4]    [5]    [6]	Instructions:
# CHECK-NEXT: 1      1     0.50                    	addl	%edi, %eax


# CHECK-LABEL: Resources:
# CHECK-NEXT: [0] - JALU0
# CHECK-NEXT: [1] - JALU1
# CHECK-NEXT: [2] - JDiv
# CHECK-NEXT: [3] - JFPA
# CHECK-NEXT: [4] - JFPM
# CHECK-NEXT: [5] - JFPU0
# CHECK-NEXT: [6] - JFPU1
# CHECK-NEXT: [7] - JLAGU
# CHECK-NEXT: [8] - JMul
# CHECK-NEXT: [9] - JSAGU
# CHECK-NEXT: [10] - JSTC
# CHECK-NEXT: [11] - JVALU0
# CHECK-NEXT: [12] - JVALU1
# CHECK-NEXT: [13] - JVIMUL


# CHECK: Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -

# CHECK: Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]   [10]   [11]   [12]   [13]   	Instructions:
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -     -      -      -      -     	addl	%edi, %eax
