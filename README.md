# Assigment5

## Penjelasan program

      clc;
      clear;

      T = 1;
      t = 0:0.1:15;
      Kp = 10;
      Kd = [1,3,5,7,9];

Program diatas berfungsi untuk membersihkan output command window dan memori ketika program dirun. Kemudian mendeklarasikan dan menginisialisasi nilai T, t, Kp, dan Kd.

      num = [T];
      den = [T T/16 1];
      sys = tf(num,den)

      C1 = tf([Kd(1) Kp],[1]);
      C2 = tf([Kd(2) Kp],[1]);
      C3 = tf([Kd(3) Kp],[1]);
      C4 = tf([Kd(4) Kp],[1]);
      C5 = tf([Kd(5) Kp],[1]);

Membuat fungsi alih dengan numerator dan denominator seperti soal pada eLok. Membuat variabel C sebagai variabel kontrol PD. Terdapat lima variabel C dari C1 hingga C5 dimana masing-masing memiliki Kd yang berbeda-beda.

      complete1 = feedback(sys*C1,1);
      complete2 = feedback(sys*C2,1);
      complete3 = feedback(sys*C3,1);
      complete4 = feedback(sys*C4,1);
      complete5 = feedback(sys*C5,1);

Selanjutnya variabel-variabel tersebut akan dikalikan tanpa feedback dan dimasukan kedalam variabel complete.

Sistem akan diuji dengan input step, impulse, dan ramp dengan memvarasikan nilai dari Kd.

      figure(1);
      hold all;
      step(complete1);
      step(complete2);
      step(complete3);
      step(complete4);
      step(complete5);
      hold off;

      com1 = stepinfo(complete1)
      com2 = stepinfo(complete2)
      com3 = stepinfo(complete3)
      com4 = stepinfo(complete4)
      com5 = stepinfo(complete5)

      figure(2);
      hold all;
      impulse(complete1);
      impulse(complete2);
      impulse(complete3);
      impulse(complete4);
      impulse(complete5);
      hold off;

      figure(3);
      hold all;
      lsim(complete1,t,t);
      lsim(complete2,t,t);
      lsim(complete3,t,t);
      lsim(complete4,t,t);
      lsim(complete5,t,t);
      hold off;

## Uji sistem

Untuk Kp = 10

| Parameter | Kd = 1  | Kd = 3  | Kd = 5  | Kd = 7  | Kd = 9  |
| --- | --- | --- | --- | --- |  ---  |
| Rise time | 0.3239 | 0.2733 | 0.2228 | 0.1832 | 0.1539 | 
| Settling time | 6.8781 | 2.2819 | 1.5011 | 1.7615 | 2.0198 |
| Overshoot | 63.4865 | 34.3278 | 23.0063 | 17.7268 | 14.9400 |
| SSE | --- | --- | --- | --- | --- |

Uji sistem tanggap step

![tes1](https://user-images.githubusercontent.com/68903409/191046890-42f4f277-251c-4b75-a121-2407f03f28b0.png)

Uji sistem tanggap impulse

![tes2](https://user-images.githubusercontent.com/68903409/191047111-f894f6b3-ede3-47e6-9bf2-ee2bfbd00f0e.png)

Uji sistem tanggap ramp dengan masukan fungsi y = t

![tes3](https://user-images.githubusercontent.com/68903409/191047163-a78fcf07-eedd-4885-a19d-dad6773cddf3.png)
