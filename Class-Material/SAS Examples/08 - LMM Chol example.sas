data cholst;
input ID	cholst	sex	age	time;
l_age = log(age);
age_at_meas = time + age;
datalines;
1	175	1	32	0
1	198	1	32	2
1	205	1	32	4
1	228	1	32	6
1	214	1	32	8
1	214	1	32	10
2	299	0	34	0
2	328	0	34	4
2	374	0	34	6
2	362	0	34	8
2	370	0	34	10
3	250	0	41	0
3	277	0	41	2
3	265	0	41	4
3	254	0	41	6
3	263	0	41	8
3	268	0	41	10
4	243	0	44	0
4	211	0	44	2
4	204	0	44	4
4	196	0	44	6
4	246	0	44	8
5	150	1	52	0
5	161	1	52	2
5	156	1	52	4
5	165	1	52	10
6	234	0	40	0
6	234	0	40	2
6	228	0	40	4
6	212	0	40	6
6	176	0	40	8
6	232	0	40	10
7	256	0	36	0
7	334	0	36	2
7	310	0	36	4
7	328	0	36	6
7	339	0	36	8
7	318	0	36	10
8	357	1	50	0
8	321	1	50	4
8	266	1	50	8
9	142	1	33	0
9	233	1	33	6
9	230	1	33	10
10	228	1	44	0
10	230	1	44	2
10	195	1	44	4
10	229	1	44	6
10	246	1	44	8
10	244	1	44	10
11	173	1	39	0
11	194	1	39	2
11	221	1	39	4
11	230	1	39	6
11	244	1	39	8
11	228	1	39	10
12	150	1	32	0
12	150	1	32	2
12	148	1	32	4
12	158	1	32	6
12	168	1	32	8
12	163	1	32	10
13	227	0	38	0
13	255	0	38	2
13	264	0	38	4
13	267	0	38	6
13	282	0	38	8
13	252	0	38	10
14	260	1	54	0
14	220	1	54	2
14	234	1	54	4
14	261	1	54	6
14	260	1	54	8
14	269	1	54	10
15	265	0	42	0
15	192	0	42	2
15	234	0	42	4
15	209	0	42	6
15	183	0	42	8
15	212	0	42	10
16	220	1	45	0
16	217	1	45	2
16	217	1	45	4
16	200	1	45	6
16	219	1	45	8
16	240	1	45	10
17	229	0	35	0
17	249	0	35	2
17	260	0	35	4
17	252	0	35	6
17	261	0	35	8
17	267	0	35	10
18	182	1	37	0
18	170	1	37	2
18	192	1	37	4
18	199	1	37	6
18	190	1	37	8
18	206	1	37	10
19	166	1	41	0
19	205	1	41	2
19	177	1	41	4
19	221	1	41	6
19	210	1	41	8
19	238	1	41	10
20	171	0	34	0
20	223	0	34	2
20	232	0	34	4
20	238	0	34	6
20	212	0	34	8
20	232	0	34	10
21	167	1	44	0
21	186	1	44	8
22	216	1	38	0
22	221	1	38	2
22	237	1	38	4
22	238	1	38	6
22	290	1	38	8
22	258	1	38	10
23	212	1	42	0
23	267	1	42	2
23	300	1	42	4
23	309	1	42	6
23	313	1	42	8
23	297	1	42	10
24	246	1	38	0
24	245	1	38	6
24	282	1	38	8
25	217	1	48	0
25	216	1	48	2
25	229	1	48	4
25	192	1	48	6
25	218	1	48	8
25	208	1	48	10
26	326	0	56	0
26	360	0	56	2
26	380	0	56	4
26	373	0	56	6
26	430	0	56	8
26	343	0	56	10
27	300	1	43	0
27	278	1	43	2
27	295	1	43	4
27	330	1	43	6
27	326	1	43	8
27	292	1	43	10
28	263	1	49	0
28	287	1	49	2
28	251	1	49	4
28	273	1	49	6
28	289	1	49	8
29	183	1	43	0
29	185	1	43	2
29	205	1	43	4
29	198	1	43	6
30	200	1	42	0
30	217	1	42	2
30	230	1	42	4
30	232	1	42	6
30	273	1	42	8
30	246	1	42	10
31	215	0	47	0
31	228	0	47	2
31	201	0	47	4
31	230	0	47	6
31	203	0	47	8
31	212	0	47	10
32	227	0	34	0
32	183	0	34	2
32	220	0	34	4
33	194	1	34	0
33	210	1	34	2
33	227	1	34	4
33	234	1	34	6
33	250	1	34	8
33	270	1	34	10
34	182	1	31	0
34	168	1	31	2
34	200	1	31	4
34	236	1	31	6
34	188	1	31	8
34	241	1	31	10
35	292	1	55	0
35	309	1	55	2
35	294	1	55	4
35	312	1	55	6
35	294	1	55	8
35	296	1	55	10
36	250	1	43	0
36	216	1	43	2
36	244	1	43	4
36	252	1	43	6
36	256	1	43	8
36	288	1	43	10
37	253	0	35	0
37	324	0	35	8
37	326	0	35	10
38	198	0	44	0
38	209	0	44	2
38	245	0	44	4
38	224	0	44	6
38	197	0	44	8
38	232	0	44	10
39	170	0	59	0
39	129	0	59	4
39	155	0	59	6
39	144	0	59	8
39	153	0	59	10
40	191	0	34	0
40	192	0	34	2
40	192	0	34	4
40	201	0	34	6
40	218	0	34	8
40	220	0	34	10
41	134	0	37	0
41	160	0	37	2
41	176	0	37	4
41	185	0	37	6
41	179	0	37	8
41	188	0	37	10
42	172	0	33	0
42	192	0	33	2
42	201	0	33	4
42	222	0	33	6
42	221	0	33	8
42	252	0	33	10
43	238	1	62	0
43	225	1	62	2
43	226	1	62	4
43	239	1	62	6
43	220	1	62	8
43	238	1	62	10
44	249	1	37	0
44	217	1	37	2
44	237	1	37	4
44	231	1	37	6
44	236	1	37	8
44	236	1	37	10
45	173	1	33	0
45	182	1	33	2
45	168	1	33	4
45	161	1	33	6
45	177	1	33	8
45	168	1	33	10
46	263	1	52	0
47	221	1	45	0
47	231	1	45	4
47	262	1	45	6
47	300	1	45	8
47	319	1	45	10
48	213	1	40	0
48	187	1	40	2
48	191	1	40	4
48	208	1	40	6
48	210	1	40	8
48	190	1	40	10
49	280	1	51	0
49	276	1	51	2
49	290	1	51	4
49	283	1	51	6
49	261	1	51	8
49	300	1	51	10
50	212	0	42	0
50	213	0	42	2
50	198	0	42	4
50	200	0	42	6
50	200	0	42	8
51	272	0	40	0
51	261	0	40	2
51	280	0	40	4
51	295	0	40	6
51	250	0	40	8
51	296	0	40	10
52	225	0	40	0
52	250	0	40	2
52	254	0	40	4
52	280	0	40	6
52	300	0	40	8
52	306	0	40	10
53	191	1	37	0
53	173	1	37	2
53	180	1	37	4
53	230	1	37	6
53	214	1	37	8
53	253	1	37	10
54	225	1	35	0
54	241	1	35	2
54	202	1	35	4
54	220	1	35	6
54	256	1	35	8
54	308	1	35	10
55	260	1	55	0
55	261	1	55	2
55	284	1	55	4
55	283	1	55	8
55	287	1	55	10
56	280	1	51	0
56	205	1	51	2
56	257	1	51	4
56	277	1	51	6
56	286	1	51	8
56	253	1	51	10
57	199	1	33	0
57	214	1	33	2
58	198	0	51	0
58	223	0	51	2
58	183	0	51	4
58	225	0	51	6
58	190	0	51	8
58	226	0	51	10
59	212	0	37	0
59	242	0	37	2
59	255	0	37	4
59	246	0	37	6
59	240	0	37	8
59	263	0	37	10
60	227	0	46	0
60	270	0	46	2
60	234	0	46	4
60	213	0	46	6
60	232	0	46	8
60	291	0	46	10
61	148	1	32	0
61	160	1	32	2
61	168	1	32	4
61	184	1	32	6
61	188	1	32	8
61	172	1	32	10
62	224	0	42	0
62	239	0	42	2
62	216	0	42	4
62	186	0	42	6
62	204	0	42	8
62	214	0	42	10
63	178	0	36	0
63	204	0	36	2
63	192	0	36	4
63	184	0	36	6
63	175	0	36	8
64	209	1	36	0
64	171	1	36	2
64	174	1	36	4
64	201	1	36	6
64	196	1	36	8
64	216	1	36	10
65	217	1	49	0
65	232	1	49	2
65	232	1	49	4
65	226	1	49	6
65	235	1	49	8
65	243	1	49	10
66	232	0	56	0
66	270	0	56	2
66	260	0	56	4
66	283	0	56	6
66	287	0	56	8
66	310	0	56	10
67	175	1	44	0
67	185	1	44	2
67	191	1	44	6
67	190	1	44	8
67	181	1	44	10
68	162	0	35	0
68	200	0	35	2
68	216	0	35	4
68	230	0	35	6
68	201	0	35	8
68	234	0	35	10
69	265	0	47	0
69	186	0	47	2
69	313	0	47	4
69	273	0	47	6
69	274	0	47	8
69	278	0	47	10
70	227	0	56	0
70	183	0	56	2
70	200	0	56	4
70	199	0	56	6
70	214	0	56	8
70	257	0	56	10
71	276	0	42	0
71	241	0	42	2
71	255	0	42	4
71	271	0	42	6
71	254	0	42	8
71	236	0	42	10
72	211	1	31	0
72	240	1	31	2
72	220	1	31	4
72	212	1	31	6
72	226	1	31	8
72	235	1	31	10
73	208	0	37	0
73	205	0	37	2
74	317	1	55	0
74	240	1	55	2
74	310	1	55	4
74	326	1	55	6
74	344	1	55	8
74	318	1	55	10
75	225	0	47	0
75	171	0	47	2
75	223	0	47	4
75	216	0	47	6
75	231	0	47	8
75	243	0	47	10
76	191	0	31	0
76	220	0	31	2
76	245	0	31	4
76	219	0	31	6
76	218	0	31	8
76	248	0	31	10
77	192	0	36	0
77	196	0	36	2
77	193	0	36	4
77	218	0	36	6
77	208	0	36	8
78	196	0	50	0
78	190	0	50	2
78	208	0	50	4
78	196	0	50	6
78	196	0	50	8
78	198	0	50	10
79	215	0	47	0
79	247	0	47	2
79	250	0	47	4
79	244	0	47	6
79	272	0	47	8
79	221	0	47	10
80	174	0	40	0
80	226	0	40	2
80	190	0	40	4
80	181	0	40	6
80	185	0	40	8
80	194	0	40	10
81	285	1	55	0
81	324	1	55	2
81	300	1	55	4
81	289	1	55	6
81	300	1	55	8
82	157	1	36	0
82	194	1	36	2
82	173	1	36	4
82	182	1	36	6
82	168	1	36	8
82	186	1	36	10
83	230	1	38	0
84	200	1	32	0
84	204	1	32	2
84	252	1	32	4
84	266	1	32	6
84	270	1	32	8
84	288	1	32	10
85	213	1	45	0
85	177	1	45	2
85	229	1	45	4
85	226	1	45	6
85	233	1	45	8
85	253	1	45	10
86	161	1	31	0
87	217	1	45	0
87	236	1	45	6
88	211	1	45	0
88	189	1	45	2
88	207	1	45	4
88	195	1	45	6
88	234	1	45	8
88	220	1	45	10
89	213	0	33	0
89	202	0	33	2
89	231	0	33	4
89	216	0	33	6
89	218	0	33	8
89	228	0	33	10
90	166	0	57	0
90	300	0	57	2
90	220	0	57	4
90	210	0	57	6
90	223	0	57	8
90	201	0	57	10
91	200	1	49	0
91	233	1	49	2
91	235	1	49	4
91	267	1	49	6
91	246	1	49	8
91	242	1	49	10
92	196	0	36	0
92	197	0	36	2
92	195	0	36	4
92	191	0	36	6
92	211	0	36	8
92	205	0	36	10
93	163	0	36	0
93	159	0	36	2
93	154	0	36	4
93	171	0	36	6
93	188	0	36	8
93	196	0	36	10
94	217	1	48	0
94	202	1	48	2
94	205	1	48	4
94	212	1	48	6
94	217	1	48	8
95	192	0	46	0
95	264	0	46	2
95	262	0	46	4
95	251	0	46	6
95	247	0	46	8
95	244	0	46	10
96	198	0	38	0
96	234	0	38	2
96	224	0	38	4
96	268	0	38	6
96	242	0	38	8
96	250	0	38	10
97	190	0	39	0
97	278	0	39	2
97	220	0	39	4
97	239	0	39	6
97	256	0	39	8
97	219	0	39	10
98	216	0	52	0
98	183	0	52	2
98	210	0	52	4
98	236	0	52	6
98	248	0	52	8
98	267	0	52	10
99	174	1	45	0
99	190	1	45	2
99	198	1	45	4
99	181	1	45	6
99	174	1	45	8
99	201	1	45	10
100	212	1	43	0
100	199	1	43	2
100	250	1	43	4
101	238	1	40	0
101	209	1	40	2
101	235	1	40	4
101	259	1	40	6
101	276	1	40	8
101	262	1	40	10
102	234	1	36	0
102	230	1	36	2
102	244	1	36	4
102	281	1	36	6
102	265	1	36	8
102	339	1	36	10
103	207	1	49	0
103	218	1	49	2
103	238	1	49	4
103	228	1	49	10
104	170	1	49	0
105	225	0	38	0
105	174	0	38	2
105	164	0	38	4
105	164	0	38	6
105	165	0	38	8
105	228	0	38	10
106	213	0	34	0
106	210	0	34	2
106	200	0	34	4
106	230	0	34	6
106	188	0	34	8
106	230	0	34	10
107	211	0	41	0
107	209	0	41	2
107	252	0	41	4
107	226	0	41	6
107	261	0	41	8
107	265	0	41	10
108	174	1	37	0
108	213	1	37	2
108	208	1	37	4
108	215	1	37	6
109	225	0	50	0
109	206	0	50	2
109	256	0	50	4
110	234	0	32	0
110	202	0	32	2
110	212	0	32	4
110	218	0	32	6
110	208	0	32	8
110	208	0	32	10
111	340	0	48	0
111	267	0	48	2
111	285	0	48	4
111	266	0	48	6
111	285	0	48	8
111	246	0	48	10
112	200	1	33	0
112	224	1	33	2
112	262	1	33	4
112	250	1	33	6
112	199	1	33	8
112	260	1	33	10
113	162	1	44	0
114	267	0	55	0
114	256	0	55	2
114	288	0	55	4
114	285	0	55	6
114	303	0	55	8
114	250	0	55	10
115	243	0	46	0
116	243	0	47	0
116	229	0	47	2
116	237	0	47	4
116	239	0	47	6
116	252	0	47	10
117	265	1	56	0
117	245	1	56	2
117	252	1	56	6
117	230	1	56	8
117	256	1	56	10
118	200	0	33	0
118	247	0	33	2
118	255	0	33	4
118	267	0	33	6
118	218	0	33	8
119	198	1	35	0
119	188	1	35	2
119	173	1	35	4
119	210	1	35	6
119	214	1	35	8
119	228	1	35	10
120	196	1	44	0
120	185	1	44	2
120	212	1	44	6
121	170	0	40	0
121	207	0	40	2
121	198	0	40	4
121	212	0	40	6
121	192	0	40	8
121	243	0	40	10
122	317	0	42	0
122	300	0	42	2
122	354	0	42	4
122	336	0	42	6
122	270	0	42	8
122	315	0	42	10
123	178	1	37	0
123	206	1	37	2
123	170	1	37	4
123	260	1	37	6
123	253	1	37	8
123	285	1	37	10
124	270	0	43	0
124	296	0	43	2
124	265	0	43	4
124	288	0	43	6
124	290	0	43	8
124	296	0	43	10
125	234	1	40	0
125	235	1	40	2
125	260	1	40	4
125	259	1	40	6
125	276	1	40	8
125	330	1	40	10
126	191	0	37	0
126	192	0	37	2
126	165	0	37	4
126	229	0	37	6
126	212	0	37	8
126	220	0	37	10
127	192	0	48	0
127	214	0	48	2
127	232	0	48	4
127	245	0	48	6
127	240	0	48	8
127	225	0	48	10
128	284	0	51	0
128	255	0	51	2
128	268	0	51	4
129	194	0	32	0
129	197	0	32	2
129	193	0	32	4
129	192	0	32	6
129	188	0	32	8
129	196	0	32	10
130	213	0	58	0
130	264	0	58	6
130	276	0	58	8
130	196	0	58	10
131	300	1	36	0
131	305	1	36	4
131	326	1	36	6
131	351	1	36	8
131	343	1	36	10
132	192	0	36	0
132	200	0	36	2
132	225	0	36	4
132	227	0	36	6
132	214	0	36	8
133	227	1	57	0
133	278	1	57	2
133	215	1	57	4
133	249	1	57	6
133	240	1	57	8
133	238	1	57	10
134	249	0	43	0
135	284	1	61	0
135	245	1	61	2
135	328	1	61	10
136	232	0	44	0
136	249	0	44	2
136	235	0	44	4
136	234	0	44	6
136	249	0	44	8
136	276	0	44	10
137	175	1	35	0
137	183	1	35	2
138	309	0	35	0
138	324	0	35	2
138	301	0	35	4
138	250	0	35	6
138	355	0	35	8
138	268	0	35	10
139	191	0	46	0
139	225	0	46	2
139	217	0	46	4
139	215	0	46	6
139	233	0	46	8
139	216	0	46	10
140	230	1	46	0
140	207	1	46	2
140	230	1	46	4
140	281	1	46	6
140	241	1	46	8
140	276	1	46	10
141	263	0	37	0
141	244	0	37	2
141	274	0	37	4
141	264	0	37	6
141	241	0	37	8
141	250	0	37	10
142	165	1	34	0
142	173	1	34	2
142	226	1	34	4
142	193	1	34	6
142	206	1	34	8
142	220	1	34	10
143	249	1	49	0
143	245	1	49	2
144	166	1	31	0
144	208	1	31	2
144	209	1	31	6
144	225	1	31	8
144	221	1	31	10
145	183	0	42	0
145	207	0	42	2
145	208	0	42	10
146	294	1	52	0
146	284	1	52	2
146	186	1	52	4
146	317	1	52	8
146	320	1	52	10
147	220	0	51	0
147	231	0	51	2
147	215	0	51	4
147	245	0	51	6
147	186	0	51	8
147	230	0	51	10
148	237	1	58	0
148	259	1	58	2
148	215	1	58	4
148	256	1	58	6
148	212	1	58	8
148	255	1	58	10
149	238	0	40	0
149	210	0	40	2
150	171	0	36	0
150	215	0	36	2
150	205	0	36	4
150	233	0	36	6
150	232	0	36	8
150	232	0	36	10
151	317	1	57	0
151	334	1	57	2
151	292	1	57	4
151	282	1	57	6
151	319	1	57	8
151	334	1	57	10
152	175	1	44	0
152	196	1	44	2
152	205	1	44	4
152	185	1	44	6
152	258	1	44	10
153	221	1	51	0
153	230	1	51	4
153	233	1	51	6
153	212	1	51	8
153	241	1	51	10
154	192	0	33	0
154	240	0	33	10
155	227	0	43	0
155	217	0	43	2
155	220	0	43	4
155	258	0	43	6
155	234	0	43	8
155	234	0	43	10
156	183	0	57	0
156	209	0	57	2
156	205	0	57	4
156	207	0	57	6
156	200	0	57	8
156	218	0	57	10
157	175	0	51	0
157	180	0	51	2
157	204	0	51	4
157	185	0	51	6
157	197	0	51	8
157	192	0	51	10
158	188	1	36	0
158	199	1	36	2
158	232	1	36	6
158	233	1	36	8
158	192	1	36	10
159	191	1	36	0
159	229	1	36	2
159	190	1	36	6
159	213	1	36	8
159	245	1	36	10
160	265	1	43	0
160	300	1	43	2
160	314	1	43	4
160	403	1	43	6
160	356	1	43	8
160	378	1	43	10
161	243	1	38	0
161	231	1	38	2
161	245	1	38	4
161	276	1	38	6
161	260	1	38	8
161	313	1	38	10
162	211	1	58	0
162	197	1	58	2
162	242	1	58	4
162	203	1	58	6
162	166	1	58	8
162	153	1	58	10
163	198	0	50	0
163	186	0	50	2
163	206	0	50	4
163	223	0	50	6
163	182	0	50	8
163	232	0	50	10
164	276	1	54	0
164	266	1	54	2
164	322	1	54	4
164	277	1	54	6
164	313	1	54	8
164	325	1	54	10
165	200	0	45	0
165	173	0	45	2
165	208	0	45	4
165	207	0	45	6
165	214	0	45	8
165	243	0	45	10
166	163	0	32	0
166	184	0	32	2
166	219	0	32	4
166	199	0	32	6
166	186	0	32	8
166	221	0	32	10
167	275	0	34	0
167	315	0	34	2
167	300	0	34	4
167	281	0	34	6
167	284	0	34	8
167	296	0	34	10
168	198	1	44	0
168	243	1	44	2
168	235	1	44	4
168	235	1	44	6
168	260	1	44	8
168	297	1	44	10
169	157	1	47	0
169	184	1	47	2
169	180	1	47	4
169	225	1	47	6
169	183	1	47	10
170	209	1	33	0
170	220	1	33	2
170	180	1	33	4
171	165	1	54	0
171	185	1	54	2
171	210	1	54	4
171	212	1	54	8
171	190	1	54	10
172	334	0	51	0
172	350	0	51	2
172	374	0	51	4
172	322	0	51	6
172	353	0	51	8
173	180	0	34	0
173	174	0	34	2
173	184	0	34	4
173	207	0	34	6
173	227	0	34	8
173	212	0	34	10
174	291	1	47	0
174	352	1	47	4
174	279	1	47	6
174	332	1	47	8
174	373	1	47	10
175	326	0	46	0
175	236	0	46	2
175	296	0	46	4
175	225	0	46	6
175	323	0	46	8
175	285	0	46	10
176	178	1	31	0
176	209	1	31	2
176	175	1	31	4
176	186	1	31	6
176	204	1	31	8
176	204	1	31	10
177	264	0	59	0
177	250	0	59	2
177	207	0	59	6
177	232	0	59	8
177	232	0	59	10
178	259	1	57	0
178	311	1	57	2
178	350	1	57	4
178	322	1	57	8
179	200	0	32	0
179	215	0	32	2
179	200	0	32	4
179	212	0	32	6
179	208	0	32	8
179	227	0	32	10
180	232	0	36	0
180	260	0	36	2
180	198	0	36	4
180	244	0	36	6
180	260	0	36	8
180	254	0	36	10
181	183	0	36	0
181	206	0	36	2
181	213	0	36	6
181	216	0	36	8
181	241	0	36	10
182	212	1	50	0
182	197	1	50	2
182	195	1	50	4
182	205	1	50	6
182	198	1	50	8
182	219	1	50	10
183	216	0	34	0
183	225	0	34	2
183	200	0	34	4
183	210	0	34	6
183	202	0	34	8
183	212	0	34	10
184	187	0	33	0
184	200	0	33	2
184	222	0	33	4
184	211	0	33	6
184	240	0	33	8
184	261	0	33	10
185	230	0	33	0
185	225	0	33	2
185	258	0	33	6
185	252	0	33	8
185	246	0	33	10
186	260	0	44	0
186	252	0	44	2
186	220	0	44	4
186	260	0	44	6
186	245	0	44	8
186	278	0	44	10
187	299	0	38	0
187	233	0	38	2
187	240	0	38	4
187	316	0	38	6
187	262	0	38	8
187	294	0	38	10
188	265	1	32	0
188	315	1	32	2
188	295	1	32	4
188	286	1	32	6
188	332	1	32	8
188	274	1	32	10
189	271	1	49	0
190	133	1	34	0
190	175	1	34	2
190	145	1	34	4
190	144	1	34	6
190	172	1	34	8
190	185	1	34	10
191	191	0	37	0
191	167	0	37	2
191	175	0	37	4
191	267	0	37	6
191	212	0	37	8
191	210	0	37	10
192	232	1	47	0
192	225	1	47	2
192	260	1	47	4
192	239	1	47	6
193	243	0	39	0
193	214	0	39	2
193	200	0	39	4
193	265	0	39	6
193	216	0	39	8
193	256	0	39	10
194	290	1	51	0
194	284	1	51	2
194	339	1	51	4
194	315	1	51	6
194	332	1	51	8
194	294	1	51	10
195	255	1	51	0
195	275	1	51	2
195	260	1	51	4
195	321	1	51	6
195	245	1	51	8
195	323	1	51	10
196	242	1	50	0
196	209	1	50	2
196	287	1	50	4
196	281	1	50	6
196	274	1	50	8
196	288	1	50	10
197	192	1	40	0
197	205	1	40	2
197	216	1	40	4
197	222	1	40	6
197	250	1	40	8
197	290	1	40	10
198	212	1	36	0
198	256	1	36	4
198	288	1	36	8
199	198	1	38	0
199	256	1	38	4
199	257	1	38	6
199	286	1	38	8
199	247	1	38	10
200	255	0	46	0
200	275	0	46	2
200	258	0	46	4
200	264	0	46	6
200	298	0	46	8
200	252	0	46	10
;
run;


*ods rtf file="C:\Users\mclaina\OneDrive - University of South Carolina\Teaching\755_Spring_2022\Examples\08-LMM Examples.rtf";


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age/ s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Age / s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Sex / s;
random intercept/subject=ID;
run;


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age/ s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age Time*l_age / s;
random intercept/subject=ID;
run;



proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age Time*Sex / s;
random intercept/subject=ID;
run;


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept/subject=ID;
run;





proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept/subject=ID;
run;

proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time/type=UN subject=ID g gcorr v vcorr;
run;

proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Age/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
run;


proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time Age/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
run;




proc mixed data=cholst;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept l_age/type=UN subject=ID g gcorr v vcorr;
run;


proc mixed data=cholst method = ml;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time/type=UN subject=ID g gcorr v vcorr;
run;


proc mixed data=cholst;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept l_age/type=UN subject=ID g gcorr v=26,34 vcorr s;
* ID 26 is 56 years old;
* ID 34 is 31 years old;
run;



proc mixed data=cholst;
class ID;
model cholst = Time Sex Age Time*Sex Time*Age/ s;
random intercept Time/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
run;



proc mixed data=cholst;
class ID;
model cholst = Time Sex l_age Time*Sex Time*l_age/ s;
random intercept l_age Time/type=UN subject=ID g gcorr v=26,34 vcorr=26,34;
* ID 26 is 56 years old;
* ID 34 is 31 years old;
run;



ods rtf close;