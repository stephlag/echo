/*
 * Copyright 2015 Netflix, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



package com.netflix.spinnaker.echo.services

import com.netflix.spinnaker.echo.model.Pipeline
import retrofit.http.GET
import retrofit.http.Headers
import retrofit.http.Path
import rx.Observable

interface Front50Service {
  @GET('/notifications/application/{application}/')
  Map getNotificationPreferences(@Path("application") String application)

  @GET("/pipelines")
  @Headers("Accept: application/json")
  Observable<List<Pipeline>> getPipelines();
}
