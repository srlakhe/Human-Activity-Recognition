# Human-Activity-Recognition

Human Activity monitoring has become a vital area of research in the health care domain. The
rise in popularity of smart wearable devices like smart watches, with embedded sensors, has
facilitated the process of collecting high quality data both easily and effectively. This area of
research is highly intriguing as it finds applications across a wide range of domains. Some of the
interesting application include, monitoring the physical activity and health condition of geriatric
population, predicting the motion of a robot using sensors, and to develop systems that help the
elderly people walk etc.
The primary objective of this project is to come up with an innovative and robust system to
monitor the human activity and to classify the positioning of a user into one of the 4 classes,
Sitting, Walking, Standing, and Laying down, using a smartwatch. The idea is to model this as a
learning problem given the quality data of human activity belonging to the four classes
mentioned above. The data has been collected for training the models and to build inference
systems for predicting unobserved data sets. The experiments are based on the smartwatch
sensor data collected by four different users. The smartwatch users contributed a couple of hours
of data for each activity. The smartwatch is embedded with highly precise sensors like
Accelerometer, Gyroscope, sensors for measuring the orientation, recording gravity, step count,
rotation motion etc. The signals captured by these sensors are well indicative of the hand motion
and enables us to predict the activity of the user. For this task, each sensor has a sampling
frequency, that is the number of samples it produces per second, of 250Hz. In this setting, the
problem can be stated as we are trying to predict a label to a series of samples. Each series of
samples of size s, a hyperparameter, forms an instance to this problem.
Throughout the project, various features were extracted from the raw signal data offered by the
smart watch. The experiments were conducted on several machine learning models like logistic
regression and random forest etc and ran on multiple settings of time windows to build a precise
inference model. Deep Learning techniques like Convolutional Neural Networks and Recurrent
Neural Networks (LSTM) have also been employed to test the performance of automatic feature
extraction techniques. We have found some interesting observations such as, increasing number
of sensors for tracking the activity and considering larger time windows improve the accuracy of
the model.
