%%Battery pack cooling

%% Battery pack power
Battery_power = readmatrix('BatteryPackPower.xlsx');


%% 
Ns = 96; %%No of cells in series
Np = 2; %%No of cells in parallel
c= 1350; %J/KgK Specific heat capacity
Mb = 150.2; %Mass of battery pack
Ri = 0.0023; %Interconnection resistance 
h_conv = 5;%Convective heat transfe
Cell_Width = 0.226;
Cell_length = 0.227;
Bc = 810.5328; %Specific heat capacity of a battery pack

%%
%Cells reistance WRT SOC & Temp
SOC = [0;0.1;0.25;0.5;0.75;0.9;1];
T = [278.15;293.15;313.15];
Cr = [0.0117,0.0085,0.0090;
    0.0110,0.0085,0.0090;
    0.0114,0.0087,0.0092;
    0.0107,0.0082,0.0088;
    0.0107,0.0083,0.0091;
    0.0113,0.0085,0.0089;
    0.0116,0.0085,0.0089];


%%
%%Nissan leaf cell data
Cell = readmatrix("NLCellData.xls");
cell_volatge = Cell(:,2:3);

%%Battery pack SOC
BSOC = readmatrix("BatteryPackSOC.xlsx");

%Tamb
Tamb = 293.15; 

%%
%%Mass flow rate
BHP_max= max(out.BHP.Data);
[Temp,index]= max(out.BHP.Data); 
BPT_max = out.BPT.Data(index); %Temperature at which maximum battery Heating Power
%%%Battery pack cooling power
%%BCP = BHP *1.1 Cooling power need to be higher than heating power here we
%%are considering 10% more
BCP = BHP_max*1.1; %Watts
%%BCP = m*Cp*(Tamb-Tb)
%%This model the we are considering the air as the cooling element
%m = BCP/(Cp*(Tamb-Tb)%Cp 1350

m_flow_air = BCP/(1350*(20.15-BPT_max)); %%Kg/sec
















