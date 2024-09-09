; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [334 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [668 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 243
	i64 43182786101618520, ; 1: BlazorScheduler.dll => 0x996a83e1ffa758 => 175
	i64 88562047454534837, ; 2: ProjectIDFMobile.dll => 0x13aa2b6831bdcb5 => 0
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 205
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 211
	i64 196720943101637631, ; 6: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 230
	i64 229794953483747371, ; 8: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 9: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 271
	i64 295915112840604065, ; 10: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 274
	i64 316157742385208084, ; 11: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 237
	i64 350667413455104241, ; 12: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 354178770117062970, ; 13: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0x4ea4bb703cff13a => 204
	i64 422779754995088667, ; 14: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 15: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 273
	i64 545109961164950392, ; 16: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 306
	i64 560278790331054453, ; 17: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 634308326490598313, ; 18: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 256
	i64 648449422406355874, ; 19: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 188
	i64 649145001856603771, ; 20: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 668723562677762733, ; 21: Microsoft.Extensions.Configuration.Binder.dll => 0x947c88986577aad => 187
	i64 683390398661839228, ; 22: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 196
	i64 737061092191485234, ; 23: CurrieTechnologies.Razor.SweetAlert2 => 0xa3a912881d5bd32 => 176
	i64 750875890346172408, ; 24: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 25: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 231
	i64 799765834175365804, ; 26: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 27: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 309
	i64 872800313462103108, ; 28: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 242
	i64 895210737996778430, ; 29: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 257
	i64 940822596282819491, ; 30: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 31: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 32: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1055774368762298424, ; 33: ar/Microsoft.Maui.Controls.resources => 0xea6dd31d50a0038 => 299
	i64 1120440138749646132, ; 34: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 287
	i64 1121665720830085036, ; 35: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 317
	i64 1268860745194512059, ; 36: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 37: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 38: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 226
	i64 1369545283391376210, ; 39: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 264
	i64 1404195534211153682, ; 40: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 41: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 42: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 43: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 208
	i64 1492954217099365037, ; 44: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 45: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1537168428375924959, ; 46: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 47: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 315
	i64 1559087064654078745, ; 48: BCrypt.Net-Next.dll => 0x15a2fd6cc69ce319 => 173
	i64 1576750169145655260, ; 49: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 285
	i64 1624659445732251991, ; 50: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 225
	i64 1628611045998245443, ; 51: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 260
	i64 1636321030536304333, ; 52: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 250
	i64 1643226597988041431, ; 53: pl/Microsoft.Maui.Controls.resources => 0x16cde9e27a8d02d7 => 319
	i64 1651782184287836205, ; 54: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 55: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 56: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1731380447121279447, ; 57: Newtonsoft.Json => 0x18071957e9b889d7 => 213
	i64 1735388228521408345, ; 58: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 59: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 60: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1776954265264967804, ; 61: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 206
	i64 1795316252682057001, ; 62: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 224
	i64 1825687700144851180, ; 63: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1836611346387731153, ; 64: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 271
	i64 1854145951182283680, ; 65: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 66: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 67: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 221
	i64 1897575647115118287, ; 68: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 273
	i64 1920760634179481754, ; 69: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 209
	i64 1959996714666907089, ; 70: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 327
	i64 1972385128188460614, ; 71: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 72: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 258
	i64 1983698669889758782, ; 73: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 301
	i64 2019660174692588140, ; 74: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 319
	i64 2040001226662520565, ; 75: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 76: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 77: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 295
	i64 2080945842184875448, ; 78: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 79: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 80: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2133195048986300728, ; 81: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 213
	i64 2145898162032646099, ; 82: ko/Microsoft.Maui.Controls.resources => 0x1dc7c302481e97d3 => 315
	i64 2161004697236311808, ; 83: CurrieTechnologies.Razor.SweetAlert2.dll => 0x1dfd6e5298b88f00 => 176
	i64 2165310824878145998, ; 84: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 218
	i64 2165725771938924357, ; 85: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 228
	i64 2200176636225660136, ; 86: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 202
	i64 2262844636196693701, ; 87: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 242
	i64 2287834202362508563, ; 88: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 89: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2295368378960711535, ; 90: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 183
	i64 2302323944321350744, ; 91: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 323
	i64 2304837677853103545, ; 92: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 270
	i64 2315304989185124968, ; 93: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 94: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 253
	i64 2335503487726329082, ; 95: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 96: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2405413894731521496, ; 97: da/Microsoft.Maui.Controls.resources => 0x2161bf315d42ddd8 => 302
	i64 2470498323731680442, ; 98: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 235
	i64 2479423007379663237, ; 99: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 280
	i64 2492380397191429704, ; 100: cs/Microsoft.Maui.Controls.resources => 0x2296b6c41bbdfe48 => 301
	i64 2497223385847772520, ; 101: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 102: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 219
	i64 2592350477072141967, ; 103: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2624866290265602282, ; 104: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 105: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 106: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 190
	i64 2706075432581334785, ; 107: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2781169761569919449, ; 108: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 206
	i64 2783046991838674048, ; 109: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 110: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 275
	i64 2815524396660695947, ; 111: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2923871038697555247, ; 112: Jsr305Binding => 0x2893ad37e69ec52f => 288
	i64 3017136373564924869, ; 113: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 114: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 287
	i64 3106852385031680087, ; 115: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3107556380337382748, ; 116: pt/Microsoft.Maui.Controls.resources => 0x2b2042103982255c => 321
	i64 3110390492489056344, ; 117: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 118: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3202009568827554833, ; 119: th/Microsoft.Maui.Controls.resources => 0x2c6fd2bce55e3c11 => 326
	i64 3266690593535380875, ; 120: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 178
	i64 3281594302220646930, ; 121: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 122: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 251
	i64 3303437397778967116, ; 123: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 222
	i64 3311221304742556517, ; 124: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 125: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 126: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 127: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 298
	i64 3396143930648122816, ; 128: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 194
	i64 3429672777697402584, ; 129: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 211
	i64 3437845325506641314, ; 130: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 131: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 277
	i64 3494946837667399002, ; 132: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 185
	i64 3508450208084372758, ; 133: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 134: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 276
	i64 3531994851595924923, ; 135: System.Numerics => 0x31042a9aade235bb => 83
	i64 3536216251757907477, ; 136: BlazorBootstrap.dll => 0x311329f1fefe4e15 => 174
	i64 3551103847008531295, ; 137: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3571415421602489686, ; 138: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 139: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 186
	i64 3647754201059316852, ; 140: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 141: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 185
	i64 3659371656528649588, ; 142: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 216
	i64 3716579019761409177, ; 143: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 144: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 269
	i64 3753897248517198740, ; 145: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 182
	i64 3772598417116884899, ; 146: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 243
	i64 3794322307918838949, ; 147: Microsoft.AspNetCore.Metadata.dll => 0x34a824092ed7bca5 => 184
	i64 3869221888984012293, ; 148: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 200
	i64 3869649043256705283, ; 149: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3889433610606858880, ; 150: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 197
	i64 3890352374528606784, ; 151: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 209
	i64 3919223565570527920, ; 152: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 153: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 154: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 155: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 156: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 157: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 158: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 207
	i64 4148881117810174540, ; 159: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 160: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 161: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 162: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 163: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 164: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 237
	i64 4205801962323029395, ; 165: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 166: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4282138915307457788, ; 167: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4356591372459378815, ; 168: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 329
	i64 4373617458794931033, ; 169: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4384840217421645357, ; 170: Microsoft.AspNetCore.Components.Forms => 0x3cda14f22443862d => 180
	i64 4397634830160618470, ; 171: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4477672992252076438, ; 172: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 173: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 174: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4636684751163556186, ; 175: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 281
	i64 4657212095206026001, ; 176: Microsoft.Extensions.Http.dll => 0x40a1bdb9c2686b11 => 199
	i64 4672453897036726049, ; 177: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 178: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 299
	i64 4716677666592453464, ; 179: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 180: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 181: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 255
	i64 4794310189461587505, ; 182: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 219
	i64 4795410492532947900, ; 183: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 276
	i64 4809057822547766521, ; 184: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 185: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4835744211636393215, ; 186: fi/Microsoft.Maui.Controls.resources => 0x431c03bd573d14ff => 306
	i64 4853321196694829351, ; 187: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 188: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 220
	i64 5081566143765835342, ; 189: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 190: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 191: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 192: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5197073077358930460, ; 193: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 181
	i64 5203618020066742981, ; 194: Xamarin.Essentials => 0x4836f704f0e652c5 => 286
	i64 5205316157927637098, ; 195: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 262
	i64 5244375036463807528, ; 196: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 197: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 198: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 199: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 254
	i64 5290786973231294105, ; 200: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5376510917114486089, ; 201: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 280
	i64 5408338804355907810, ; 202: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 278
	i64 5423376490970181369, ; 203: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 204: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 205: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 206: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 233
	i64 5457765010617926378, ; 207: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5507995362134886206, ; 208: System.Core.dll => 0x4c705499688c873e => 21
	i64 5527431512186326818, ; 209: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 210: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 211: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 212: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 223
	i64 5591791169662171124, ; 213: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5650097808083101034, ; 214: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 215: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 283
	i64 5724799082821825042, ; 216: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 246
	i64 5757522595884336624, ; 217: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 232
	i64 5783556987928984683, ; 218: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 219: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 252
	i64 5939174725034091446, ; 220: pt-BR/Microsoft.Maui.Controls.resources => 0x526c2ff200a2a3b6 => 320
	i64 5959344983920014087, ; 221: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 272
	i64 5979151488806146654, ; 222: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 223: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6010974535988770325, ; 224: Microsoft.Extensions.Diagnostics.dll => 0x536b457e33877615 => 192
	i64 6068057819846744445, ; 225: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 322
	i64 6102788177522843259, ; 226: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 272
	i64 6222399776351216807, ; 227: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 228: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 229: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 230: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6319713645133255417, ; 231: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 256
	i64 6357457916754632952, ; 232: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 333
	i64 6401687960814735282, ; 233: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 253
	i64 6504860066809920875, ; 234: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 228
	i64 6548213210057960872, ; 235: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 239
	i64 6557084851308642443, ; 236: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 284
	i64 6560151584539558821, ; 237: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 203
	i64 6589202984700901502, ; 238: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 290
	i64 6591971792923354531, ; 239: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 254
	i64 6617685658146568858, ; 240: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6713440830605852118, ; 241: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6734140735192831707, ; 242: uk/Microsoft.Maui.Controls.resources => 0x5d747951d4a816db => 328
	i64 6739853162153639747, ; 243: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6772837112740759457, ; 244: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 245: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 321
	i64 6786606130239981554, ; 246: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 247: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 248: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 249: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 250: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6920570528939222495, ; 251: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 182
	i64 7011053663211085209, ; 252: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 248
	i64 7060896174307865760, ; 253: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 254: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 255: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 256: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 249
	i64 7112547816752919026, ; 257: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7192745174564810625, ; 258: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 218
	i64 7220009545223068405, ; 259: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 325
	i64 7270811800166795866, ; 260: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 261: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 262: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 263: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 264: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 217
	i64 7377312882064240630, ; 265: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7439799228237803094, ; 266: it/Microsoft.Maui.Controls.resources => 0x673f79faf756ee56 => 313
	i64 7488575175965059935, ; 267: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 268: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7592577537120840276, ; 269: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 270: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7637365915383206639, ; 271: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 286
	i64 7642002156153824904, ; 272: ro/Microsoft.Maui.Controls.resources => 0x6a0dd878d2516688 => 322
	i64 7654504624184590948, ; 273: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 274: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 275: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 316
	i64 7714652370974252055, ; 276: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 277: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 257
	i64 7735176074855944702, ; 278: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 279: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 293
	i64 7791074099216502080, ; 280: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 281: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 282: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 225
	i64 7919757340696389605, ; 283: Microsoft.Extensions.Diagnostics.Abstractions => 0x6de8a157378027e5 => 193
	i64 8014722069583580780, ; 284: Microsoft.AspNetCore.Components.Forms.dll => 0x6f3a03422b034e6c => 180
	i64 8025517457475554965, ; 285: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 286: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 287: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 288: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 251
	i64 8085230611270010360, ; 289: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 290: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 291: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 292: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 293: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 294: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 295: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 297
	i64 8246048515196606205, ; 296: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 212
	i64 8264926008854159966, ; 297: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 298: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 299: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 300: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 301: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 234
	i64 8400357532724379117, ; 302: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 266
	i64 8410671156615598628, ; 303: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 304: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 255
	i64 8476828615142258695, ; 305: BCrypt.Net-Next => 0x75a3beb69b6bb807 => 173
	i64 8515752553183989521, ; 306: el/Microsoft.Maui.Controls.resources => 0x762e07d427a84f11 => 304
	i64 8518412311883997971, ; 307: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8557640666902467377, ; 308: tr/Microsoft.Maui.Controls.resources => 0x76c2d8d8a2289331 => 327
	i64 8563666267364444763, ; 309: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8573305974629105867, ; 310: sk/Microsoft.Maui.Controls.resources => 0x76fa805c508080cb => 324
	i64 8598790081731763592, ; 311: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 245
	i64 8601935802264776013, ; 312: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 278
	i64 8614108721271900878, ; 313: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 320
	i64 8623059219396073920, ; 314: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 315: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 316: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 317: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 265
	i64 8648495978913578441, ; 318: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8684531736582871431, ; 319: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 320: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8816904670177563593, ; 321: Microsoft.Extensions.Diagnostics => 0x7a5bf015646a93c9 => 192
	i64 8853378295825400934, ; 322: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 294
	i64 8906941675023136603, ; 323: he/Microsoft.Maui.Controls.resources => 0x7b9bd0432ee0775b => 308
	i64 8941376889969657626, ; 324: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 325: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 268
	i64 8954753533646919997, ; 326: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9138683372487561558, ; 327: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9312692141327339315, ; 328: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 283
	i64 9324707631942237306, ; 329: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 224
	i64 9468215723722196442, ; 330: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9554839972845591462, ; 331: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 332: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 289
	i64 9584643793929893533, ; 333: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9650158550865574924, ; 334: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 189
	i64 9659729154652888475, ; 335: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 336: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 337: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 338: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 235
	i64 9702891218465930390, ; 339: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 340: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 285
	i64 9808709177481450983, ; 341: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 342: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 232
	i64 9834056768316610435, ; 343: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 344: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9884103019517044980, ; 345: hi/Microsoft.Maui.Controls.resources => 0x892b6353f9ade8f4 => 309
	i64 9907349773706910547, ; 346: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 245
	i64 9933555792566666578, ; 347: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 348: Microsoft.Maui => 0x8a2b8315b36616ac => 210
	i64 9974604633896246661, ; 349: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 350: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 305
	i64 10017511394021241210, ; 351: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 202
	i64 10038780035334861115, ; 352: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 353: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 354: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 355: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 356: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 208
	i64 10105485790837105934, ; 357: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10205853378024263619, ; 358: Microsoft.Extensions.Configuration.Binder => 0x8da279930adb4fc3 => 187
	i64 10226222362177979215, ; 359: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 295
	i64 10226489408795347955, ; 360: sv/Microsoft.Maui.Controls.resources => 0x8debc9ef5e8a8bf3 => 325
	i64 10229024438826829339, ; 361: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 239
	i64 10236703004850800690, ; 362: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 363: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 364: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 292
	i64 10360651442923773544, ; 365: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 366: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 367: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 277
	i64 10406448008575299332, ; 368: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 298
	i64 10430153318873392755, ; 369: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 236
	i64 10546663366131771576, ; 370: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 371: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 372: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 373: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 374: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10734191584620811116, ; 375: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 196
	i64 10785150219063592792, ; 376: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10809043855025277762, ; 377: Microsoft.Extensions.Options.ConfigurationExtensions => 0x9601701e0c668b42 => 204
	i64 10822644899632537592, ; 378: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 379: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 380: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 226
	i64 10865192094218110914, ; 381: ProjectIDFMobile => 0x96c8eaa4b840c7c2 => 0
	i64 10899834349646441345, ; 382: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 383: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 384: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 10984274332520666918, ; 385: zh-Hant/Microsoft.Maui.Controls.resources => 0x986ffb4ee955d726 => 332
	i64 11002576679268595294, ; 386: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 201
	i64 11009005086950030778, ; 387: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 210
	i64 11019817191295005410, ; 388: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 223
	i64 11023048688141570732, ; 389: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 390: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11051904132540108364, ; 391: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 195
	i64 11071824625609515081, ; 392: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 290
	i64 11128133081269842136, ; 393: vi/Microsoft.Maui.Controls.resources => 0x9a6f1213fa5cb0d8 => 329
	i64 11136029745144976707, ; 394: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 288
	i64 11150130305267896488, ; 395: zh-Hans/Microsoft.Maui.Controls.resources => 0x9abd386fcccf90a8 => 331
	i64 11162124722117608902, ; 396: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 282
	i64 11188319605227840848, ; 397: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11218356222449480316, ; 398: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 179
	i64 11226290749488709958, ; 399: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 203
	i64 11235648312900863002, ; 400: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11329751333533450475, ; 401: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 402: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 238
	i64 11347436699239206956, ; 403: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 404: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 267
	i64 11432101114902388181, ; 405: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 406: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 407: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 408: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 409: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 248
	i64 11513602507638267977, ; 410: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 214
	i64 11529969570048099689, ; 411: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 282
	i64 11530571088791430846, ; 412: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 200
	i64 11580057168383206117, ; 413: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 221
	i64 11591352189662810718, ; 414: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 275
	i64 11597940890313164233, ; 415: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 416: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 249
	i64 11692977985522001935, ; 417: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 418: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 308
	i64 11707554492040141440, ; 419: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 420: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11888774080858266727, ; 421: hu/Microsoft.Maui.Controls.resources => 0xa4fd6909806d9c67 => 311
	i64 11991047634523762324, ; 422: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 423: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12048689113179125827, ; 424: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 197
	i64 12058074296353848905, ; 425: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 198
	i64 12063623837170009990, ; 426: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 427: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 428: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 429: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12124060477258521817, ; 430: id/Microsoft.Maui.Controls.resources => 0xa84150c49e58dcd9 => 312
	i64 12137774235383566651, ; 431: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 279
	i64 12145679461940342714, ; 432: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 433: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 215
	i64 12201331334810686224, ; 434: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 435: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12313367145828839434, ; 436: System.IO.Pipelines => 0xaae1de2e1c17f00a => 214
	i64 12332222936682028543, ; 437: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12375446203996702057, ; 438: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 439: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 247
	i64 12466513435562512481, ; 440: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 261
	i64 12475113361194491050, ; 441: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 333
	i64 12487638416075308985, ; 442: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 241
	i64 12517810545449516888, ; 443: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12533156002265635263, ; 444: ru/Microsoft.Maui.Controls.resources => 0xadeeb6fb059919bf => 323
	i64 12538491095302438457, ; 445: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 229
	i64 12550732019250633519, ; 446: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12681088699309157496, ; 447: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 313
	i64 12699999919562409296, ; 448: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 449: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 230
	i64 12708238894395270091, ; 450: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 451: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 452: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 453: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 284
	i64 12823819093633476069, ; 454: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 326
	i64 12828192437253469131, ; 455: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 296
	i64 12835242264250840079, ; 456: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 457: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 205
	i64 12843770487262409629, ; 458: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 459: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12982280885948128408, ; 460: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 240
	i64 13003699287675270979, ; 461: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 183
	i64 13068258254871114833, ; 462: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13129914918964716986, ; 463: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 244
	i64 13173818576982874404, ; 464: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 465: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 300
	i64 13222659110913276082, ; 466: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 314
	i64 13239674268801700939, ; 467: ca/Microsoft.Maui.Controls.resources => 0xb7bcc599c5ce144b => 300
	i64 13343850469010654401, ; 468: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 469: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13401370062847626945, ; 470: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 279
	i64 13404347523447273790, ; 471: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 234
	i64 13431476299110033919, ; 472: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 473: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 291
	i64 13463706743370286408, ; 474: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 475: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 293
	i64 13467053111158216594, ; 476: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 328
	i64 13491513212026656886, ; 477: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 227
	i64 13545416393490209236, ; 478: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 312
	i64 13550417756503177631, ; 479: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 194
	i64 13572454107664307259, ; 480: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 269
	i64 13578472628727169633, ; 481: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 482: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 483: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 240
	i64 13647894001087880694, ; 484: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 485: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 220
	i64 13702626353344114072, ; 486: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 487: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 488: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 489: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 490: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 307
	i64 13768883594457632599, ; 491: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 492: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 310
	i64 13828521679616088467, ; 493: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 294
	i64 13881769479078963060, ; 494: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 495: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 496: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13959074834287824816, ; 497: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 247
	i64 14075334701871371868, ; 498: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14082136096249122791, ; 499: Microsoft.AspNetCore.Metadata => 0xc36dcc2b4fa28fe7 => 184
	i64 14100563506285742564, ; 500: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 302
	i64 14124974489674258913, ; 501: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 229
	i64 14125464355221830302, ; 502: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14178052285788134900, ; 503: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 216
	i64 14212104595480609394, ; 504: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 505: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 506: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 507: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 508: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 509: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 267
	i64 14298246716367104064, ; 510: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 511: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 512: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14327924848409182502, ; 513: BlazorBootstrap => 0xc6d703bcadec0126 => 174
	i64 14331727281556788554, ; 514: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 217
	i64 14346402571976470310, ; 515: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 516: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14486659737292545672, ; 517: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 252
	i64 14495724990987328804, ; 518: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 270
	i64 14522721392235705434, ; 519: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 304
	i64 14551742072151931844, ; 520: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 521: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 522: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 523: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 524: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 262
	i64 14669215534098758659, ; 525: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 190
	i64 14690985099581930927, ; 526: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14792063746108907174, ; 527: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 291
	i64 14832630590065248058, ; 528: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14852515768018889994, ; 529: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 238
	i64 14889905118082851278, ; 530: GoogleGson.dll => 0xcea391d0969961ce => 177
	i64 14892012299694389861, ; 531: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 332
	i64 14912225920358050525, ; 532: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 533: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 534: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 191
	i64 14984936317414011727, ; 535: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 536: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 537: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 241
	i64 15015154896917945444, ; 538: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 539: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15051741671811457419, ; 540: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0xd0e2874d8f44218b => 193
	i64 15071021337266399595, ; 541: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 542: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15115185479366240210, ; 543: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 544: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 545: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 268
	i64 15227001540531775957, ; 546: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 186
	i64 15234786388537674379, ; 547: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 548: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 549: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 231
	i64 15273147323526128252, ; 550: de/Microsoft.Maui.Controls.resources => 0xd3f51e91f4fba27c => 303
	i64 15279429628684179188, ; 551: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 297
	i64 15299439993936780255, ; 552: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 553: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370334346939861994, ; 554: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 236
	i64 15391712275433856905, ; 555: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 191
	i64 15427448221306938193, ; 556: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 181
	i64 15443314347085689186, ; 557: nl/Microsoft.Maui.Controls.resources => 0xd651ac9394bc7162 => 318
	i64 15474781042002767710, ; 558: hr/Microsoft.Maui.Controls.resources => 0xd6c1775e69862f5e => 310
	i64 15478373401424648762, ; 559: es/Microsoft.Maui.Controls.resources => 0xd6ce3a99c4c55a3a => 305
	i64 15481710163200268842, ; 560: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 195
	i64 15526743539506359484, ; 561: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 562: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 563: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15541854775306130054, ; 564: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 565: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 566: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 260
	i64 15592226634512578529, ; 567: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 178
	i64 15609085926864131306, ; 568: System.dll => 0xd89e9cf3334914ea => 164
	i64 15661133872274321916, ; 569: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 570: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 303
	i64 15693321268133550672, ; 571: BlazorScheduler => 0xd9c9e08bed2eda50 => 175
	i64 15710114879900314733, ; 572: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 573: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 311
	i64 15755368083429170162, ; 574: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 575: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 274
	i64 15817206913877585035, ; 576: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15827202283623377193, ; 577: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 189
	i64 15847085070278954535, ; 578: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 579: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 580: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 207
	i64 15934062614519587357, ; 581: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 582: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 583: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 584: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 15995174293784908801, ; 585: nb/Microsoft.Maui.Controls.resources => 0xddfa46462d825401 => 317
	i64 16018552496348375205, ; 586: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16054465462676478687, ; 587: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16154507427712707110, ; 588: System => 0xe03056ea4e39aa26 => 164
	i64 16198848395322856833, ; 589: ms/Microsoft.Maui.Controls.resources => 0xe0cddeca55a01581 => 316
	i64 16219561732052121626, ; 590: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16315482530584035869, ; 591: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 592: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 201
	i64 16337011941688632206, ; 593: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 594: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 246
	i64 16423015068819898779, ; 595: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 296
	i64 16454459195343277943, ; 596: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16491294355724214223, ; 597: zh-HK/Microsoft.Maui.Controls.resources => 0xe4dcd8d787589fcf => 330
	i64 16496768397145114574, ; 598: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16558262036769511634, ; 599: Microsoft.Extensions.Http => 0xe5cac397cf7b98d2 => 199
	i64 16589693266713801121, ; 600: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 259
	i64 16621146507174665210, ; 601: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 233
	i64 16649148416072044166, ; 602: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 212
	i64 16677317093839702854, ; 603: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 266
	i64 16702652415771857902, ; 604: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 605: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737304880976948124, ; 606: ja/Microsoft.Maui.Controls.resources => 0xe846da1c780aeb9c => 314
	i64 16737807731308835127, ; 607: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 608: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 609: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 610: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16822611501064131242, ; 611: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 612: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 613: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 614: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 615: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16977952268158210142, ; 616: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 617: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 259
	i64 16998075588627545693, ; 618: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 264
	i64 17008137082415910100, ; 619: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 620: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 222
	i64 17031351772568316411, ; 621: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 263
	i64 17037200463775726619, ; 622: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 250
	i64 17047433665992082296, ; 623: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 188
	i64 17062143951396181894, ; 624: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17079998892748052666, ; 625: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 179
	i64 17089008752050867324, ; 626: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 331
	i64 17118171214553292978, ; 627: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17187273293601214786, ; 628: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 629: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 630: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17205988430934219272, ; 631: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 198
	i64 17230721278011714856, ; 632: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 633: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 634: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 635: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 636: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17360349973592121190, ; 637: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 289
	i64 17438153253682247751, ; 638: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 324
	i64 17470386307322966175, ; 639: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17482873938501421891, ; 640: fr/Microsoft.Maui.Controls.resources => 0xf29fa538054fcb43 => 307
	i64 17509662556995089465, ; 641: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17522591619082469157, ; 642: GoogleGson => 0xf32cc03d27a5bf25 => 177
	i64 17590473451926037903, ; 643: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 215
	i64 17627500474728259406, ; 644: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 645: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 646: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 330
	i64 17704177640604968747, ; 647: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 261
	i64 17710060891934109755, ; 648: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 258
	i64 17712670374920797664, ; 649: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 650: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17838668724098252521, ; 651: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 652: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 292
	i64 17928294245072900555, ; 653: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17992315986609351877, ; 654: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18025913125965088385, ; 655: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 656: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 318
	i64 18116111925905154859, ; 657: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 227
	i64 18121036031235206392, ; 658: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 263
	i64 18146411883821974900, ; 659: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 660: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 661: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 662: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 663: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 244
	i64 18305135509493619199, ; 664: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 265
	i64 18318849532986632368, ; 665: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18380184030268848184, ; 666: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 281
	i64 18439108438687598470 ; 667: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [668 x i32] [
	i32 243, ; 0
	i32 175, ; 1
	i32 0, ; 2
	i32 205, ; 3
	i32 171, ; 4
	i32 211, ; 5
	i32 58, ; 6
	i32 230, ; 7
	i32 151, ; 8
	i32 271, ; 9
	i32 274, ; 10
	i32 237, ; 11
	i32 132, ; 12
	i32 204, ; 13
	i32 56, ; 14
	i32 273, ; 15
	i32 306, ; 16
	i32 95, ; 17
	i32 256, ; 18
	i32 188, ; 19
	i32 129, ; 20
	i32 187, ; 21
	i32 196, ; 22
	i32 176, ; 23
	i32 145, ; 24
	i32 231, ; 25
	i32 18, ; 26
	i32 309, ; 27
	i32 242, ; 28
	i32 257, ; 29
	i32 150, ; 30
	i32 104, ; 31
	i32 95, ; 32
	i32 299, ; 33
	i32 287, ; 34
	i32 317, ; 35
	i32 36, ; 36
	i32 28, ; 37
	i32 226, ; 38
	i32 264, ; 39
	i32 50, ; 40
	i32 115, ; 41
	i32 70, ; 42
	i32 208, ; 43
	i32 65, ; 44
	i32 170, ; 45
	i32 145, ; 46
	i32 315, ; 47
	i32 173, ; 48
	i32 285, ; 49
	i32 225, ; 50
	i32 260, ; 51
	i32 250, ; 52
	i32 319, ; 53
	i32 40, ; 54
	i32 89, ; 55
	i32 81, ; 56
	i32 213, ; 57
	i32 66, ; 58
	i32 62, ; 59
	i32 86, ; 60
	i32 206, ; 61
	i32 224, ; 62
	i32 106, ; 63
	i32 271, ; 64
	i32 102, ; 65
	i32 35, ; 66
	i32 221, ; 67
	i32 273, ; 68
	i32 209, ; 69
	i32 327, ; 70
	i32 119, ; 71
	i32 258, ; 72
	i32 301, ; 73
	i32 319, ; 74
	i32 142, ; 75
	i32 141, ; 76
	i32 295, ; 77
	i32 53, ; 78
	i32 35, ; 79
	i32 141, ; 80
	i32 213, ; 81
	i32 315, ; 82
	i32 176, ; 83
	i32 218, ; 84
	i32 228, ; 85
	i32 202, ; 86
	i32 242, ; 87
	i32 8, ; 88
	i32 14, ; 89
	i32 183, ; 90
	i32 323, ; 91
	i32 270, ; 92
	i32 51, ; 93
	i32 253, ; 94
	i32 136, ; 95
	i32 101, ; 96
	i32 302, ; 97
	i32 235, ; 98
	i32 280, ; 99
	i32 301, ; 100
	i32 116, ; 101
	i32 219, ; 102
	i32 163, ; 103
	i32 166, ; 104
	i32 67, ; 105
	i32 190, ; 106
	i32 80, ; 107
	i32 206, ; 108
	i32 101, ; 109
	i32 275, ; 110
	i32 117, ; 111
	i32 288, ; 112
	i32 78, ; 113
	i32 287, ; 114
	i32 114, ; 115
	i32 321, ; 116
	i32 121, ; 117
	i32 48, ; 118
	i32 326, ; 119
	i32 178, ; 120
	i32 128, ; 121
	i32 251, ; 122
	i32 222, ; 123
	i32 82, ; 124
	i32 110, ; 125
	i32 75, ; 126
	i32 298, ; 127
	i32 194, ; 128
	i32 211, ; 129
	i32 53, ; 130
	i32 277, ; 131
	i32 185, ; 132
	i32 69, ; 133
	i32 276, ; 134
	i32 83, ; 135
	i32 174, ; 136
	i32 172, ; 137
	i32 116, ; 138
	i32 186, ; 139
	i32 156, ; 140
	i32 185, ; 141
	i32 216, ; 142
	i32 167, ; 143
	i32 269, ; 144
	i32 182, ; 145
	i32 243, ; 146
	i32 184, ; 147
	i32 200, ; 148
	i32 32, ; 149
	i32 197, ; 150
	i32 209, ; 151
	i32 122, ; 152
	i32 72, ; 153
	i32 62, ; 154
	i32 161, ; 155
	i32 113, ; 156
	i32 88, ; 157
	i32 207, ; 158
	i32 105, ; 159
	i32 18, ; 160
	i32 146, ; 161
	i32 118, ; 162
	i32 58, ; 163
	i32 237, ; 164
	i32 17, ; 165
	i32 52, ; 166
	i32 92, ; 167
	i32 329, ; 168
	i32 55, ; 169
	i32 180, ; 170
	i32 129, ; 171
	i32 152, ; 172
	i32 41, ; 173
	i32 92, ; 174
	i32 281, ; 175
	i32 199, ; 176
	i32 50, ; 177
	i32 299, ; 178
	i32 162, ; 179
	i32 13, ; 180
	i32 255, ; 181
	i32 219, ; 182
	i32 276, ; 183
	i32 36, ; 184
	i32 67, ; 185
	i32 306, ; 186
	i32 109, ; 187
	i32 220, ; 188
	i32 99, ; 189
	i32 99, ; 190
	i32 11, ; 191
	i32 11, ; 192
	i32 181, ; 193
	i32 286, ; 194
	i32 262, ; 195
	i32 25, ; 196
	i32 128, ; 197
	i32 76, ; 198
	i32 254, ; 199
	i32 109, ; 200
	i32 280, ; 201
	i32 278, ; 202
	i32 106, ; 203
	i32 2, ; 204
	i32 26, ; 205
	i32 233, ; 206
	i32 157, ; 207
	i32 21, ; 208
	i32 49, ; 209
	i32 43, ; 210
	i32 126, ; 211
	i32 223, ; 212
	i32 59, ; 213
	i32 119, ; 214
	i32 283, ; 215
	i32 246, ; 216
	i32 232, ; 217
	i32 3, ; 218
	i32 252, ; 219
	i32 320, ; 220
	i32 272, ; 221
	i32 38, ; 222
	i32 124, ; 223
	i32 192, ; 224
	i32 322, ; 225
	i32 272, ; 226
	i32 137, ; 227
	i32 149, ; 228
	i32 85, ; 229
	i32 90, ; 230
	i32 256, ; 231
	i32 333, ; 232
	i32 253, ; 233
	i32 228, ; 234
	i32 239, ; 235
	i32 284, ; 236
	i32 203, ; 237
	i32 290, ; 238
	i32 254, ; 239
	i32 133, ; 240
	i32 96, ; 241
	i32 328, ; 242
	i32 3, ; 243
	i32 105, ; 244
	i32 321, ; 245
	i32 33, ; 246
	i32 154, ; 247
	i32 158, ; 248
	i32 155, ; 249
	i32 82, ; 250
	i32 182, ; 251
	i32 248, ; 252
	i32 143, ; 253
	i32 87, ; 254
	i32 19, ; 255
	i32 249, ; 256
	i32 51, ; 257
	i32 218, ; 258
	i32 325, ; 259
	i32 61, ; 260
	i32 54, ; 261
	i32 4, ; 262
	i32 97, ; 263
	i32 217, ; 264
	i32 17, ; 265
	i32 313, ; 266
	i32 155, ; 267
	i32 84, ; 268
	i32 29, ; 269
	i32 45, ; 270
	i32 286, ; 271
	i32 322, ; 272
	i32 64, ; 273
	i32 66, ; 274
	i32 316, ; 275
	i32 172, ; 276
	i32 257, ; 277
	i32 1, ; 278
	i32 293, ; 279
	i32 47, ; 280
	i32 24, ; 281
	i32 225, ; 282
	i32 193, ; 283
	i32 180, ; 284
	i32 165, ; 285
	i32 108, ; 286
	i32 12, ; 287
	i32 251, ; 288
	i32 63, ; 289
	i32 27, ; 290
	i32 23, ; 291
	i32 93, ; 292
	i32 168, ; 293
	i32 12, ; 294
	i32 297, ; 295
	i32 212, ; 296
	i32 29, ; 297
	i32 103, ; 298
	i32 14, ; 299
	i32 126, ; 300
	i32 234, ; 301
	i32 266, ; 302
	i32 91, ; 303
	i32 255, ; 304
	i32 173, ; 305
	i32 304, ; 306
	i32 9, ; 307
	i32 327, ; 308
	i32 86, ; 309
	i32 324, ; 310
	i32 245, ; 311
	i32 278, ; 312
	i32 320, ; 313
	i32 71, ; 314
	i32 168, ; 315
	i32 1, ; 316
	i32 265, ; 317
	i32 5, ; 318
	i32 44, ; 319
	i32 27, ; 320
	i32 192, ; 321
	i32 294, ; 322
	i32 308, ; 323
	i32 158, ; 324
	i32 268, ; 325
	i32 112, ; 326
	i32 121, ; 327
	i32 283, ; 328
	i32 224, ; 329
	i32 159, ; 330
	i32 131, ; 331
	i32 289, ; 332
	i32 57, ; 333
	i32 189, ; 334
	i32 138, ; 335
	i32 83, ; 336
	i32 30, ; 337
	i32 235, ; 338
	i32 10, ; 339
	i32 285, ; 340
	i32 171, ; 341
	i32 232, ; 342
	i32 150, ; 343
	i32 94, ; 344
	i32 309, ; 345
	i32 245, ; 346
	i32 60, ; 347
	i32 210, ; 348
	i32 157, ; 349
	i32 305, ; 350
	i32 202, ; 351
	i32 64, ; 352
	i32 88, ; 353
	i32 79, ; 354
	i32 47, ; 355
	i32 208, ; 356
	i32 143, ; 357
	i32 187, ; 358
	i32 295, ; 359
	i32 325, ; 360
	i32 239, ; 361
	i32 74, ; 362
	i32 91, ; 363
	i32 292, ; 364
	i32 135, ; 365
	i32 90, ; 366
	i32 277, ; 367
	i32 298, ; 368
	i32 236, ; 369
	i32 112, ; 370
	i32 42, ; 371
	i32 159, ; 372
	i32 4, ; 373
	i32 103, ; 374
	i32 196, ; 375
	i32 70, ; 376
	i32 204, ; 377
	i32 60, ; 378
	i32 39, ; 379
	i32 226, ; 380
	i32 0, ; 381
	i32 153, ; 382
	i32 56, ; 383
	i32 34, ; 384
	i32 332, ; 385
	i32 201, ; 386
	i32 210, ; 387
	i32 223, ; 388
	i32 21, ; 389
	i32 163, ; 390
	i32 195, ; 391
	i32 290, ; 392
	i32 329, ; 393
	i32 288, ; 394
	i32 331, ; 395
	i32 282, ; 396
	i32 140, ; 397
	i32 179, ; 398
	i32 203, ; 399
	i32 89, ; 400
	i32 147, ; 401
	i32 238, ; 402
	i32 162, ; 403
	i32 267, ; 404
	i32 6, ; 405
	i32 169, ; 406
	i32 31, ; 407
	i32 107, ; 408
	i32 248, ; 409
	i32 214, ; 410
	i32 282, ; 411
	i32 200, ; 412
	i32 221, ; 413
	i32 275, ; 414
	i32 167, ; 415
	i32 249, ; 416
	i32 140, ; 417
	i32 308, ; 418
	i32 59, ; 419
	i32 144, ; 420
	i32 311, ; 421
	i32 81, ; 422
	i32 74, ; 423
	i32 197, ; 424
	i32 198, ; 425
	i32 130, ; 426
	i32 25, ; 427
	i32 7, ; 428
	i32 93, ; 429
	i32 312, ; 430
	i32 279, ; 431
	i32 137, ; 432
	i32 215, ; 433
	i32 113, ; 434
	i32 9, ; 435
	i32 214, ; 436
	i32 104, ; 437
	i32 19, ; 438
	i32 247, ; 439
	i32 261, ; 440
	i32 333, ; 441
	i32 241, ; 442
	i32 33, ; 443
	i32 323, ; 444
	i32 229, ; 445
	i32 46, ; 446
	i32 313, ; 447
	i32 30, ; 448
	i32 230, ; 449
	i32 57, ; 450
	i32 134, ; 451
	i32 114, ; 452
	i32 284, ; 453
	i32 326, ; 454
	i32 296, ; 455
	i32 55, ; 456
	i32 205, ; 457
	i32 6, ; 458
	i32 77, ; 459
	i32 240, ; 460
	i32 183, ; 461
	i32 111, ; 462
	i32 244, ; 463
	i32 102, ; 464
	i32 300, ; 465
	i32 314, ; 466
	i32 300, ; 467
	i32 170, ; 468
	i32 115, ; 469
	i32 279, ; 470
	i32 234, ; 471
	i32 76, ; 472
	i32 291, ; 473
	i32 85, ; 474
	i32 293, ; 475
	i32 328, ; 476
	i32 227, ; 477
	i32 312, ; 478
	i32 194, ; 479
	i32 269, ; 480
	i32 160, ; 481
	i32 2, ; 482
	i32 240, ; 483
	i32 24, ; 484
	i32 220, ; 485
	i32 32, ; 486
	i32 117, ; 487
	i32 37, ; 488
	i32 16, ; 489
	i32 307, ; 490
	i32 52, ; 491
	i32 310, ; 492
	i32 294, ; 493
	i32 20, ; 494
	i32 123, ; 495
	i32 154, ; 496
	i32 247, ; 497
	i32 131, ; 498
	i32 184, ; 499
	i32 302, ; 500
	i32 229, ; 501
	i32 148, ; 502
	i32 216, ; 503
	i32 120, ; 504
	i32 28, ; 505
	i32 132, ; 506
	i32 100, ; 507
	i32 134, ; 508
	i32 267, ; 509
	i32 153, ; 510
	i32 97, ; 511
	i32 125, ; 512
	i32 174, ; 513
	i32 217, ; 514
	i32 69, ; 515
	i32 72, ; 516
	i32 252, ; 517
	i32 270, ; 518
	i32 304, ; 519
	i32 136, ; 520
	i32 124, ; 521
	i32 71, ; 522
	i32 111, ; 523
	i32 262, ; 524
	i32 190, ; 525
	i32 152, ; 526
	i32 291, ; 527
	i32 118, ; 528
	i32 238, ; 529
	i32 177, ; 530
	i32 332, ; 531
	i32 127, ; 532
	i32 133, ; 533
	i32 191, ; 534
	i32 77, ; 535
	i32 46, ; 536
	i32 241, ; 537
	i32 73, ; 538
	i32 63, ; 539
	i32 193, ; 540
	i32 98, ; 541
	i32 84, ; 542
	i32 43, ; 543
	i32 61, ; 544
	i32 268, ; 545
	i32 186, ; 546
	i32 37, ; 547
	i32 40, ; 548
	i32 231, ; 549
	i32 303, ; 550
	i32 297, ; 551
	i32 160, ; 552
	i32 98, ; 553
	i32 236, ; 554
	i32 191, ; 555
	i32 181, ; 556
	i32 318, ; 557
	i32 310, ; 558
	i32 305, ; 559
	i32 195, ; 560
	i32 135, ; 561
	i32 20, ; 562
	i32 65, ; 563
	i32 125, ; 564
	i32 75, ; 565
	i32 260, ; 566
	i32 178, ; 567
	i32 164, ; 568
	i32 156, ; 569
	i32 303, ; 570
	i32 175, ; 571
	i32 5, ; 572
	i32 311, ; 573
	i32 49, ; 574
	i32 274, ; 575
	i32 144, ; 576
	i32 189, ; 577
	i32 139, ; 578
	i32 100, ; 579
	i32 207, ; 580
	i32 123, ; 581
	i32 120, ; 582
	i32 142, ; 583
	i32 39, ; 584
	i32 317, ; 585
	i32 68, ; 586
	i32 41, ; 587
	i32 164, ; 588
	i32 316, ; 589
	i32 73, ; 590
	i32 165, ; 591
	i32 201, ; 592
	i32 127, ; 593
	i32 246, ; 594
	i32 296, ; 595
	i32 68, ; 596
	i32 330, ; 597
	i32 169, ; 598
	i32 199, ; 599
	i32 259, ; 600
	i32 233, ; 601
	i32 212, ; 602
	i32 266, ; 603
	i32 151, ; 604
	i32 45, ; 605
	i32 314, ; 606
	i32 108, ; 607
	i32 48, ; 608
	i32 96, ; 609
	i32 31, ; 610
	i32 23, ; 611
	i32 166, ; 612
	i32 22, ; 613
	i32 138, ; 614
	i32 78, ; 615
	i32 54, ; 616
	i32 259, ; 617
	i32 264, ; 618
	i32 10, ; 619
	i32 222, ; 620
	i32 263, ; 621
	i32 250, ; 622
	i32 188, ; 623
	i32 16, ; 624
	i32 179, ; 625
	i32 331, ; 626
	i32 139, ; 627
	i32 13, ; 628
	i32 15, ; 629
	i32 122, ; 630
	i32 198, ; 631
	i32 87, ; 632
	i32 149, ; 633
	i32 22, ; 634
	i32 34, ; 635
	i32 79, ; 636
	i32 289, ; 637
	i32 324, ; 638
	i32 147, ; 639
	i32 307, ; 640
	i32 80, ; 641
	i32 177, ; 642
	i32 215, ; 643
	i32 42, ; 644
	i32 26, ; 645
	i32 330, ; 646
	i32 261, ; 647
	i32 258, ; 648
	i32 107, ; 649
	i32 110, ; 650
	i32 7, ; 651
	i32 292, ; 652
	i32 44, ; 653
	i32 161, ; 654
	i32 148, ; 655
	i32 318, ; 656
	i32 227, ; 657
	i32 263, ; 658
	i32 38, ; 659
	i32 15, ; 660
	i32 146, ; 661
	i32 8, ; 662
	i32 244, ; 663
	i32 265, ; 664
	i32 130, ; 665
	i32 281, ; 666
	i32 94 ; 667
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
