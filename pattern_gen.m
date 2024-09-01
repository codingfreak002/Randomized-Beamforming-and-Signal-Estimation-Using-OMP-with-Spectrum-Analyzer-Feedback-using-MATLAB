function [F,E] = pattern_gen(M,N,thh)
    p=16;                       % Unit cell periodicity
    dx=p*(M-1);
    dy=p*(N-1); 
    f=5.5;                       % Frequency in GHz
    lamda=300/f;
    Fd=512;                   % Focal length

%%%%% Assign Desired beam direction

phh=0;
theta_h=deg2rad(thh);
phi_h=deg2rad(phh);

x=linspace(-dx/2,dx/2,M);
y=linspace(-dy/2,dy/2,N);

% Preallocate phase_h and phi_mn_digital
phase_h = zeros(M, N);
phi_mn_digital = zeros(M, N);

for i=1:length(x)
    for j=1:length(y)
        phase_h(i,j)=rad2deg((2*pi)/lamda)*(sqrt((0-x(i))^2+(0-y(j))^2+Fd^2)-(sin(theta_h)*(x(i)*cos(phi_h)+y(j)*sin(phi_h))));         %phase calculation on the aperture       
    end
end

%phase compression
 for i=1:length(x)
     for j=1:length(y)
         while phase_h(i,j)>360
             phase_h(i,j)=phase_h(i,j)-360;
         end
     end
 end

%phase digitalization
  for i=1:length(x)
    for j=1:length(y)
        if (90<=phase_h(i,j))&&(phase_h(i,j)<270)
            phi_mn_digital(i,j)=1;
        else
            phi_mn_digital(i,j)=0;
        end
    end
 end
 
A = phi_mn_digital';
 
[X,Y]=size(A);
B = zeros(X,Y);
B(1,1) = A(8,2);
B(1,2) = A(6,2);
B(1,3) = A(7,3);
B(1,4) = A(9,3);
B(1,5) = A(10,3);
B(1,6) = A(8,3);
B(1,7) = A(6,3);
B(1,8) = A(7,4);
B(1,9) = A(10,2);
B(1,10) = A(9,2);
B(1,11) = A(7,2);
B(1,12) = A(6,1);
B(1,13) = A(8,1);
B(1,14) = A(10,1);
B(1,15) = A(9,1);
B(1,16) = A(7,1);

B(2,1) = A(6,5);
B(2,2) = A(7,6);
B(2,3) = A(9,6);
B(2,4) = A(10,6);
B(2,5) = A(8,6);
B(2,6) = A(6,6);
B(2,7) = A(7,7);
B(2,8) = A(9,7);
B(2,9) = A(8,5);
B(2,10) = A(10,5);
B(2,11) = A(9,5);
B(2,12) = A(7,5);
B(2,13) = A(6,4);
B(2,14) = A(8,4);
B(2,15) = A(10,4);
B(2,16) = A(9,4);

B(3,1) = A(10,7);
B(3,2) = A(8,7);
B(3,3) = A(6,7);
B(3,4) = A(7,8);
B(3,5) = A(9,8);
B(3,6) = A(10,8);
B(3,7) = A(8,8);
B(3,8) = A(6,8);
B(3,9) = A(10,10);
B(3,10) = A(9,10);
B(3,11) = A(7,10);
B(3,12) = A(6,9); 
B(3,13) = A(8,9);
B(3,14) = A(10,9);
B(3,15) = A(9,9);
B(3,16) = A(7,9);

B(4,1) = A(8,10);
B(4,2) = A(6,10);
B(4,3) = A(7,11);
B(4,4) = A(9,11);
B(4,5) = A(10,11);
B(4,6) = A(8,11);
B(4,7) = A(6,11);
B(4,8) = A(7,12);
B(4,9) = A(8,13);
B(4,10) = A(10,13);
B(4,11) = A(9,13); 
B(4,12) = A(7,13);
B(4,13) = A(6,12);
B(4,14) = A(8,12);
B(4,15) = A(10,12);
B(4,16) = A(9,12);

B(5,1) = A(6,13);
B(5,2) = A(7,14);
B(5,3) = A(9,14);
B(5,4) = A(10,14);
B(5,5) = A(8,14);
B(5,6) = A(6,14);
B(5,7) = A(7,15);
B(5,8) = A(9,15);
B(5,9) = A(6,16);
B(5,10) = A(8,16);
B(5,11) = A(10,16); 
B(5,12) = A(9,16);
B(5,13) = A(7,16);
B(5,14) = A(6,15);
B(5,15) = A(8,15);
B(5,16) = A(10,15);

B(6,1) = A(2,15);
B(6,2) = A(4,15);
B(6,3) = A(5,14);
B(6,4) = A(3,14);
B(6,5) = A(1,14);
B(6,6) = A(2,14);
B(6,7) = A(4,14);
B(6,8) = A(5,13);
B(6,9) = A(1,15);
B(6,10) = A(3,15);
B(6,11) = A(5,15); 
B(6,12) = A(4,16);
B(6,13) = A(2,16);
B(6,14) = A(1,16);
B(6,15) = A(3,16);
B(6,16) = A(5,16);

B(7,1) = A(4,12);
B(7,2) = A(5,11);
B(7,3) = A(3,11);
B(7,4) = A(1,11);
B(7,5) = A(2,11);
B(7,6) = A(4,11);
B(7,7) = A(5,10);
B(7,8) = A(3,10);
B(7,9) = A(2,12);
B(7,10) = A(1,12);
B(7,11) = A(3,12); 
B(7,12) = A(5,12);
B(7,13) = A(4,13);
B(7,14) = A(2,13);
B(7,15) = A(1,13);
B(7,16) = A(3,13);

B(8,1) = A(5,8);
B(8,2) = A(3,8);
B(8,3) = A(1,8);
B(8,4) = A(2,8);
B(8,5) = A(4,8);
B(8,6) = A(5,7);
B(8,7) = A(3,7);
B(8,8) = A(1,7);
B(8,9) = A(4,9);
B(8,10) = A(2,9);
B(8,11) = A(1,9); 
B(8,12) = A(3,9);
B(8,13) = A(5,9);
B(8,14) = A(4,10);
B(8,15) = A(2,10);
B(8,16) = A(1,10);

B(9,1) = A(2,7);
B(9,2) = A(4,7);
B(9,3) = A(5,6);
B(9,4) = A(3,6);
B(9,5) = A(1,6);
B(9,6) = A(2,6);
B(9,7) = A(4,6);
B(9,8) = A(5,5);
B(9,9) = A(2,4);
B(9,10) = A(1,4);
B(9,11) = A(3,4); 
B(9,12) = A(5,4);
B(9,13) = A(4,5);
B(9,14) = A(2,5);
B(9,15) = A(1,5);
B(9,16) = A(3,5);

B(10,1) = A(4,4);
B(10,2) = A(5,3);
B(10,3) = A(3,3);
B(10,4) = A(1,3);
B(10,5) = A(2,3);
B(10,6) = A(4,3);
B(10,7) = A(5,2);
B(10,8) = A(3,2);
B(10,9) = A(4,1);
B(10,10) = A(2,1);
B(10,11) = A(1,1); 
B(10,12) = A(3,1);
B(10,13) = A(5,1);
B(10,14) = A(4,2);
B(10,15) = A(2,2);
B(10,16) = A(1,2);

C=reshape(B.', [], 1); % mapped pattern
D=reshape(A.', [], 1); % actual pattern
E= C.'; % mapped pattern
F= D.'; % actual pattern
end