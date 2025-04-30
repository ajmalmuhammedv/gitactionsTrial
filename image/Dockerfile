FROM public.ecr.aws/lambda/python:3.13

#copy requirements.txt
COPY requirements.txt ${LAMBDA_TASK_ROOT}

#INSTALL THE SPECIFIC PACKAGES
RUN pip install -r requirements.txt

#copy all files in the ./src
COPY src/* ${LAMBDA_TASK_ROOT}

#SET the cmd to your handler.
CMD ["hello_world.lambda_handler"]