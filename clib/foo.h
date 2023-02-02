
typedef struct SumResult {
    double result;
} SumResult;

#ifdef __cplusplus
extern "C" 
{
#endif

#ifdef _WIN32
__declspec(dllexport)
#endif
void array_square(double* arr_in, double* arr_out, int length);

#ifdef _WIN32
__declspec(dllexport)
#endif
SumResult array_sum(double* arr, int length);

#ifdef __cplusplus
}
#endif